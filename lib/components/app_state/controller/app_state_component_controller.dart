import 'dart:developer';

import 'package:cebras_app/architecture/controller/controller.dart';
import 'package:cebras_app/components/app_state/event/app_state_component_event.dart';
import 'package:cebras_app/components/app_state/provider/app_state_component_provider.dart';
import 'package:flutter/cupertino.dart';

/// Criado para lidar com os ciclo de vidas do aplicativo
/// Em qualquer tela do app.
class AppStateComponentController
    extends BaseController<AppStateComponentEvent> {
  final AppStateComponentProvider _appStateComponentProvider;

  AppStateComponentController(
      {required AppStateComponentProvider appStateComponentProvider})
      : _appStateComponentProvider = appStateComponentProvider;

  @override
  void handleEvents(AppStateComponentEvent? event) {
    if (event is OnStateAppChane) {
      handleAppLifecyclerChange((event).state);
    }
  }

  /// Listener dos ciclo de vida do App.
  void handleAppLifecyclerChange(AppLifecycleState state) {
    log('AppLifecycleState: $state');
    _appStateComponentProvider.sendToApiSomething();
  }
}
