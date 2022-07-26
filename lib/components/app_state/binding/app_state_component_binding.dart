import 'package:cebras_app/architecture/injection/injector.dart';
import 'package:cebras_app/components/app_state/controller/app_state_component_controller.dart';
import 'package:cebras_app/components/app_state/provider/app_state_component_provider.dart';
import 'package:cebras_app/core/auth_session/auth_session.dart';
import 'package:cebras_app/core/auth_session/auth_session_impl.dart';
import 'package:cebras_app/core/auth_session/mapper/session_mapper.dart';
import 'package:cebras_app/core/connector/connector.dart';
import 'package:cebras_app/core/connector/connector_impl.dart';
import 'package:cebras_app/core/http/http_client.dart';
import 'package:cebras_app/core/http/http_client_impl.dart';
import 'package:dio/dio.dart';

class AppStateComponentBinding extends Injector {
  @override
  void dependencies() {
    put(SessionMapper(), permanent: true);
    put<AuthSession>(AuthSessionImpl(mapper: find()), permanent: true);
    put<Connector>(ConnectorImpl(authSession: find()), permanent: true);
    put<HttpClient>(HttpClientImpl(dio: Dio(), authSession: find()),
        permanent: true);
    put(AppStateComponentProvider(), permanent: true);
    put(AppStateComponentController(appStateComponentProvider: find()),
        permanent: true);
  }
}
