import 'package:flutter/cupertino.dart';

abstract class AppStateComponentEvent {
  AppStateComponentEvent();
}

class OnStateAppChane extends AppStateComponentEvent {
  final AppLifecycleState state;
  OnStateAppChane({required this.state});

  @override
  String toString() => 'OnAppStateChange $state';
}
