import 'package:base_flutter_project/architecture/injection/injector.dart';
import 'package:base_flutter_project/presentation/screens/login/login_controller.dart';
import 'package:base_flutter_project/presentation/screens/login/login_provider.dart';

class LoginInjector extends Injector {
  @override
  void dependencies() {
    put(LoginProvider());
    put(LoginController(loginProvider: find()));
  }
}
