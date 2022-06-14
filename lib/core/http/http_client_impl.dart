import 'package:base_flutter_project/architecture/utils/constants.dart';
import 'package:base_flutter_project/core/auth_session/auth_session.dart';
import 'package:base_flutter_project/core/http/http_client.dart';
import 'package:base_flutter_project/core/http/http_interceptors.dart';
import 'package:dio/dio.dart';

class HttpClientImpl implements HttpClient {
  final Dio _dio;
  final AuthSession _authSession;

  HttpClientImpl({
    required Dio dio,
    required AuthSession authSession,
  })  : _dio = dio,
        _authSession = authSession {
    _dio
      ..options.baseUrl = BASE_URL
      ..options.connectTimeout = 15000
      ..options.receiveTimeout = 15000
      ..options.responseType = ResponseType.json
      ..options.contentType = 'application/json'
      ..interceptors.addAll([
        HttpInterceptor(
          dio: _dio,
          authSession: _authSession,
        ),
      ]);
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  @override
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int p1, int p2)? onSendProgress,
    void Function(int p1, int p2)? onReceiveProgress,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int p1, int p2)? onSendProgress,
    void Function(int p1, int p2)? onReceiveProgress,
  }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int p1, int p2)? onSendProgress,
    void Function(int p1, int p2)? onReceiveProgress,
  }) {
    return _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
