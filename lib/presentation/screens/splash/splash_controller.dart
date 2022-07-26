import 'package:cebras_app/architecture/controller/controller.dart';
import 'package:cebras_app/presentation/screens/splash/splash_event.dart';
import 'package:cebras_app/presentation/screens/splash/splash_provider.dart';
import 'package:cebras_app/routes/route_name.dart';

class SplashController extends BaseController<SplashEvent> {
  final SplashProvider _provider;

  SplashController({required SplashProvider provider}) : _provider = provider;

  @override
  void onInit() {
    super.onInit();
    dispatchEvent(CheckLogin());
  }

  @override
  void handleEvents(SplashEvent? event) {
    if (event is CheckLogin) {
      _checkLogin();
    }
  }

  Future<void> _checkLogin() async {
    await _provider.checkLogin();
    popAndToNamed(RouteName.login);
  }
}
