abstract class LoginEvent {
  LoginEvent();
}

class DoLogin extends LoginEvent {
  DoLogin();

  @override
  String toString() => 'Login Event';
}

class GetDeviceInfo extends LoginEvent {
  GetDeviceInfo();

  @override
  String toString() => 'GetDeviceInfo';
}
