import 'package:base_flutter_project/core/auth_session/auth_session.dart';
import 'package:base_flutter_project/core/auth_session/mapper/session_mapper.dart';
import 'package:base_flutter_project/core/auth_session/model/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSessionImpl implements AuthSession {
  final String _key = '_session';
  final SessionMapper mapper;

  AuthSessionImpl({
    required this.mapper,
  });

  Future<SharedPreferences> get _box async {
    return SharedPreferences.getInstance();
  }

  @override
  Future<void> clear() => _box.then((value) => value.remove(_key));

  @override
  Future<bool> get isLogged => _box.then((value) =>
      value.getString(_key) != null && value.getString(_key)!.isNotEmpty);

  @override
  Future<void> save(SessionModel sessionModel) =>
      _box.then((value) => value.setString(_key, mapper.toJson(sessionModel)));

  @override
  Future<SessionModel?> get session async {
    SessionModel? mySession;
    await _box.then((value) {
      final json = value.getString(_key);
      if (json != null) {
        mySession = mapper.fromJson(json);
      }
    });
    return mySession;
  }
}
