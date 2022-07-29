import 'package:cebras_app/core/http/http_client.dart';

class LoginWelcomeQuestionsProvider {
  final HttpClient _httpClient;

  LoginWelcomeQuestionsProvider({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
