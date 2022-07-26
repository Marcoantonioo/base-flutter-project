import 'package:cebras_app/app_injector.dart';
import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:cebras_app/components/app_state/event/app_state_component_event.dart';
import 'package:cebras_app/components/app_state/binding/app_state_component_binding.dart';
import 'package:cebras_app/components/app_state/controller/app_state_component_controller.dart';
import 'package:cebras_app/main.dart';
import 'package:cebras_app/routes/route_name.dart';
import 'package:cebras_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppStateComponent extends State<MyApp> with WidgetsBindingObserver {
  /// Necessário injeção aqui pois aqui onde tudo se inicia.
  final binding = AppStateComponentBinding().dependencies();

  late AppStateComponentController _controller;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _controller = Get.find();
    Intl.defaultLocale = 'pt-BR';
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _controller.dispatchEvent(OnStateAppChane(state: state));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Base App',
      theme: AppThemeData.lightThemeData,
      initialBinding: AppInjector(),
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: RouteName.splash,
    );
  }
}
