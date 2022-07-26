import 'dart:async';
import 'dart:developer';

import 'package:cebras_app/components/app_state/app_state_component.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  return runZonedGuarded(() async {
    runApp(const MyApp());
  }, (error, stack) {
    log(stack.toString());
    log(error.toString());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends AppStateComponent {}
