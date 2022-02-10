import 'package:base_flutter_project/app_injector.dart';
import 'package:base_flutter_project/presentation/screens/login/login_screen.dart';
import 'package:base_flutter_project/routes/route_name.dart';
import 'package:base_flutter_project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Base App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AppInjector(),
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: RouteName.login,
    );
  }
}
