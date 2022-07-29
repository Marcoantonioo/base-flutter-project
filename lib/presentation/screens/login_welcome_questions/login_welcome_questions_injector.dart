import 'package:cebras_app/architecture/injection/injector.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_controller.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_provider.dart';

class LoginWelcomeQuestionsInjector extends Injector {
  @override
  void dependencies() {
    put(LoginWelcomeQuestionsProvider(httpClient: find()));
    put(LoginWelcomeQuestionsController(provider: find()));
  }
}
