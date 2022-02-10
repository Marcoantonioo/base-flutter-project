import 'package:base_flutter_project/architecture/controller/mixin/message_mixin.dart';
import 'package:base_flutter_project/architecture/controller/mixin/navigator_mixin.dart';
import 'package:base_flutter_project/architecture/exception/remote_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseController<Event> extends GetxController
    with NavigatorMixin, MessageMixin {
  late Rx<State> _state;
  late Rx<Event?> dispatchEvent;

  @protected
  @mustCallSuper
  @override
  void onInit() {
    super.onInit();
    _handleSetInitialValues();

    /// Responsável por ouvir os eventos
    dispatchEvent.listen(handleEvents);
  }

  Future<void> doOnlineAction({
    required Function action,
    Function? onError,
    Function? onFinish,
  }) async {
    try {
      _state(State.loading);
      await action();
    } on RemoteException catch (_) {
      _state(State.error);
      showFailure('Não foi possível comunicar com a API');
    } finally {
      _state(State.idle);
      onFinish?.call();
    }
  }

  bool isLoading() => _state.value == State.loading;

  bool isStateWithError() => _state.value == State.error;

  bool isStateIdle() => _state.value == State.idle;

  @protected
  void handleEvents(Event? event);

  void _handleSetInitialValues() {
    _state = State.idle.obs;
    dispatchEvent = (null as Event?).obs;
  }
}

enum State {
  loading,
  idle,
  error,
}

extension StateExtension on State {
  bool get isLoading => this == State.loading;
  bool get isError => this == State.error;
  bool get isIdle => this == State.idle;
}
