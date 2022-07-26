import 'dart:convert';
import 'dart:developer';

import 'package:cebras_app/core/auth_session/auth_session.dart';
import 'package:cebras_app/core/auth_session/model/session_model.dart';
import 'package:cebras_app/presentation/screens/login/login_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class HttpInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final AuthSession _authSession;

  HttpInterceptor({
    required Dio dio,
    required AuthSession authSession,
  })  : _dio = dio,
        _authSession = authSession;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String method = options.method;
    final Uri uri = options.uri;
    final dynamic data = options.data;

    String token = "";

    await _authSession.session.then((value) {
      if (value != null) {
        token = value.token;
        options.headers['Authorization'] = 'Bearer ${value.token}';
      }
    });

    try {
      log("✈️ REQUEST[$method] => PATH: $uri \n Token: $token \n DATA: ${jsonEncode(data)}");
    } catch (e) {
      log("✈️ REQUEST[$method] => PATH: $uri \n Token: $token \n DATA: $data");
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      data = jsonEncode(err.response?.data);
    } catch (e) {}
    if (err.response?.statusCode == 401) {
      final LoginProvider loginProvider = Get.find();
      final newToken = await loginProvider.refreshToken();
      await _authSession.save(SessionModel(token: newToken));
      await _retry(err.response!.requestOptions);
    }
    log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
