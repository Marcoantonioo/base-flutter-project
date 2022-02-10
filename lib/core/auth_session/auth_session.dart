import 'package:base_flutter_project/core/auth_session/model/session_model.dart';

abstract class AuthSession {
  Future<bool> get isLogged;
  Future<SessionModel?> get session;

  Future<void> save(SessionModel sessionModel);
  Future<void> clear();
}
