import 'package:base_flutter_project/presentation/screens/login/login_controller.dart';
import 'package:base_flutter_project/presentation/screens/login/login_event.dart';
import 'package:base_flutter_project/presentation/widgets/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends ScreenView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.isLoading()
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () => controller.dispatchEvent(DoLogin()),
                  child: const Text('Do Login'),
                ),
        ),
      ),
    );
  }
}
