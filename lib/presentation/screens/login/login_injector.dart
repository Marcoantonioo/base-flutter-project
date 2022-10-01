import 'package:cebras_app/architecture/injection/injector.dart';
import 'package:cebras_app/presentation/screens/login/login_controller.dart';
import 'package:cebras_app/presentation/screens/login/login_provider.dart';

class LoginInjector extends Injector {
  @override
  void dependencies() {
    put(LoginProvider(httpClient: find()));
    put(LoginController(loginProvider: find(), deviceInfo: find()));
  }
}
