import 'dart:developer';
import 'package:base_flutter_project/architecture/utils/constants.dart';
import 'package:base_flutter_project/core/auth_session/auth_session.dart';
import 'package:base_flutter_project/core/connector/connector.dart';
import 'package:get/get.dart';

class ConnectorImpl extends Connector {
  final AuthSession authSession;

  ConnectorImpl({
    required this.authSession,
  });

  @override
  void onInit() async {
    httpClient.baseUrl = BASE_URL;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 20);

    if (await _hasSession()) {
      _handleRequestWhenAuth();
    } else {
      _handleNormalRequest();
    }
  }

  void _handleNormalRequest() {
    _addRequest(httpClient);
  }

  void _handleRequestWhenAuth() {
    authSession.session.then((session) {
      var headers = {'Authorization': "Bearer ${session?.token}"};

      log("Token ${session?.token}");

      _addRequest(httpClient, headers: headers);
    });
  }

  void _addRequest(GetHttpClient httpClient, {Map<String, String>? headers}) {
    httpClient.addRequestModifier<void>((request) async {
      if (headers != null) {
        request.headers.addAll(headers);
      }

      log('Realizado um [${request.method}] para a url [${request.url}]');
      return request;
    });
  }

  Future<bool> _hasSession() =>
      authSession.session.then((value) => value != null);
}
