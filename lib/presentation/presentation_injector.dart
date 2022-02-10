import 'package:base_flutter_project/architecture/injection/injector.dart';
import 'package:base_flutter_project/presentation/screens/login/login_injector.dart';

class PresentationInjector extends Injector {
  @override
  void dependencies() {
    LoginInjector().dependencies();
  }
}
