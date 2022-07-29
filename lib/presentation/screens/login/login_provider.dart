import 'package:cebras_app/architecture/exception/remote_exception.dart';
import 'package:cebras_app/core/http/http_client.dart';
import 'package:cebras_app/presentation/screens/login/model/credential_model.dart';

class LoginProvider {
  final HttpClient _httpClient;

  LoginProvider({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<String> login(CredentialModel credential) async {
    //final request = await _httpClient.post('auth/login');

    await Future.delayed(const Duration(seconds: 2));

    return "";
    //throw RemoteException();
  }

  Future<String> refreshToken() async {
    await Future.delayed(const Duration(seconds: 1));

    return "newToken";
  }
}
