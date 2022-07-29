import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:cebras_app/architecture/utils/images.dart';
import 'package:cebras_app/presentation/screens/splash/splash_controller.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:flutter/material.dart';
class SplashScreen extends ScreenView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.lightColorScheme.primary,
      body: Center(
        child: Image.asset(Images.logo),
      ),
    );
  }
}
