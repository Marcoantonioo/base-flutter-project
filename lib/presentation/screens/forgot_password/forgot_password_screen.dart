import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_controller.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_event.dart';
import 'package:cebras_app/presentation/screens/forgot_password/states/forgot_password_step_1.dart';
import 'package:cebras_app/presentation/screens/forgot_password/states/forgot_password_step_2.dart';
import 'package:cebras_app/presentation/screens/forgot_password/states/forgot_password_step_3.dart';
import 'package:cebras_app/presentation/widgets/app_bar_widget.dart';
import 'package:cebras_app/presentation/widgets/dismiss_keyboard_on_tap.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends ScreenView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardOnTap(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Recuperar senha',
          onBackPressed: () => controller.dispatchEvent(PreviousStep()),
        ),
        backgroundColor: AppThemeData.lightColorScheme.background,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(28.0),
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => ForgotPasswordScreenBuilder(currentPage: controller.step.value),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordScreenBuilder extends StatelessWidget {
  final int currentPage;

  const ForgotPasswordScreenBuilder({Key? key, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentPage == 0) {
      return const ForgotPasswordStep1();
    } else if (currentPage == 1) {
      return const ForgotPasswordStep2();
    } else {
      return const ForgotPasswordStep3();
    }
  }
}
