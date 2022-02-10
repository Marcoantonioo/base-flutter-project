import 'package:base_flutter_project/architecture/injection/injector.dart';
import 'package:base_flutter_project/core/auth_session/auth_session.dart';
import 'package:base_flutter_project/core/auth_session/auth_session_impl.dart';
import 'package:base_flutter_project/core/auth_session/mapper/session_mapper.dart';
import 'package:base_flutter_project/core/connector/connector.dart';
import 'package:base_flutter_project/core/connector/connector_impl.dart';

class CoreInjector extends Injector {
  @override
  void dependencies() {
    put(SessionMapper());
    put<AuthSession>(AuthSessionImpl(mapper: find()));
    put<Connector>(ConnectorImpl(authSession: find()));
  }
}
