abstract class SplashEvent {
  SplashEvent();
}

class CheckLogin extends SplashEvent {
  @override
  String toString() => 'checking login';
}
