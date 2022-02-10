import 'package:base_flutter_project/architecture/exception/remote_exception.dart';
import 'package:base_flutter_project/core/connector/connector.dart';
import 'package:base_flutter_project/presentation/screens/login/model/credential_model.dart';

class LoginProvider extends Connector {
  Future<String> login(CredentialModel credential) async {
    await Future.delayed(const Duration(seconds: 2));

    throw RemoteException();
  }
}
