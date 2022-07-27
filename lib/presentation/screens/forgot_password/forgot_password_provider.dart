import 'package:cebras_app/core/http/http_client.dart';

class ForgotPasswordProvider {
  final HttpClient _httpClient;

  ForgotPasswordProvider({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<bool> sendEmail(String email) async {
    await Future.delayed(const Duration(seconds: 4));
    return true;
  }

  Future<bool> checkVerificationCode(String code, String email) async {
    await Future.delayed(const Duration(seconds: 4));
    return true;
  }

  Future<bool> changePassword(String email, String password) async {
    await Future.delayed(const Duration(seconds: 4));
    return true;
  }
}
