import 'package:base_flutter_project/architecture/injection/injector.dart';
import 'package:base_flutter_project/components/app_state/controller/app_state_component_controller.dart';
import 'package:base_flutter_project/components/app_state/provider/app_state_component_provider.dart';
import 'package:base_flutter_project/core/auth_session/auth_session.dart';
import 'package:base_flutter_project/core/auth_session/auth_session_impl.dart';
import 'package:base_flutter_project/core/auth_session/mapper/session_mapper.dart';
import 'package:base_flutter_project/core/connector/connector.dart';
import 'package:base_flutter_project/core/connector/connector_impl.dart';

class AppStateComponentBinding extends Injector {
  @override
  void dependencies() {
    put(SessionMapper(), permanent: true);
    put<AuthSession>(AuthSessionImpl(mapper: find()), permanent: true);
    put<Connector>(ConnectorImpl(authSession: find()), permanent: true);
    put(AppStateComponentProvider(), permanent: true);
    put(AppStateComponentController(appStateComponentProvider: find()),
        permanent: true);
  }
}
