import 'package:cebras_app/architecture/injection/injector.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_controller.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_provider.dart';

class ForgotPasswordInjector extends Injector {
  @override
  void dependencies() {
    put(ForgotPasswordProvider(httpClient: find()));
    put(ForgotPasswordController(provider: find()));
  }
}
