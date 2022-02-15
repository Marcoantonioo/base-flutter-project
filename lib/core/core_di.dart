import 'package:base_flutter_project/architecture/injection/injector.dart';

class CoreInjector extends Injector {
  @override
  void dependencies() {
    /// Deixar comentado, as dependencias são criadas na inicialização do
    /// [AppStateComponent]
    // put(SessionMapper());
    // put<AuthSession>(AuthSessionImpl(mapper: find()));
    // put<Connector>(ConnectorImpl(authSession: find()));
  }
}
