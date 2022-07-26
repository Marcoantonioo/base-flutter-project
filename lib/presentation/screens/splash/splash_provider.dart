import 'package:cebras_app/core/http/http_client.dart';

class SplashProvider {
  final HttpClient _httpClient;

  SplashProvider({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
