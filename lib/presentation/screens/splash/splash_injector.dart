import 'package:cebras_app/architecture/injection/injector.dart';
import 'package:cebras_app/presentation/screens/splash/splash_controller.dart';
import 'package:cebras_app/presentation/screens/splash/splash_provider.dart';

class SplashInjector extends Injector {
  @override
  void dependencies() {
    put(SplashProvider(httpClient: find()));
    put(SplashController(provider: find()));
  }
}
