abstract class LoginEvent {
  LoginEvent();
}

class DoLogin extends LoginEvent {
  DoLogin();

  @override
  String toString() => 'Login Event';
}
