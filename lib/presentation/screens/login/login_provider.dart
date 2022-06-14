import 'package:base_flutter_project/architecture/exception/remote_exception.dart';
import 'package:base_flutter_project/core/http/http_client.dart';
import 'package:base_flutter_project/presentation/screens/login/model/credential_model.dart';

class LoginProvider {
  final HttpClient _httpClient;

  LoginProvider({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<String> login(CredentialModel credential) async {
    //final request = await _httpClient.post('auth/login');

    await Future.delayed(const Duration(seconds: 2));

    throw RemoteException();
  }

  Future<String> refreshToken() async {
    await Future.delayed(const Duration(seconds: 1));

    return "newToken";
  }
}
