import 'package:cebras_app/presentation/screens/login/login_controller.dart';
import 'package:cebras_app/presentation/screens/login/login_event.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends ScreenView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDeviceInfo(),
              _buildLoginButton(),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildDeviceInfo() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Device Model:\n ${controller.deviceInfo.value.model}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Device Manufacturer:\n ${controller.deviceInfo.value.manufacturer}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Device Identifier:\n ${controller.deviceInfo.value.identifier}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Obx(
      () => controller.isLoading()
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () => controller.dispatchEvent(DoLogin()),
              style: ButtonStyle(),
              child: const Text('Do Login'),
            ),
    );
  }
}
