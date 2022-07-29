import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_controller.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_event.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/questions/step/login_questions_step_one.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/questions/step/login_questions_step_three.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/questions/step/login_questions_step_two.dart';
import 'package:cebras_app/presentation/widgets/app_bar_widget.dart';
import 'package:cebras_app/presentation/widgets/dismiss_keyboard_on_tap.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginQuestionsScreen extends ScreenView<LoginWelcomeQuestionsController> {
  const LoginQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardOnTap(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Complemente o seu cadastro',
          onBackPressed: () {
            controller.dispatchEvent(PreviousStep());
          },
        ),
        backgroundColor: AppThemeData.lightColorScheme.background,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(28.0),
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PASSO ${controller.step.value} DE 3',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: const Color(0xff666666),
                      fontWeight: FontWeight.bold),
                ),
                LoginQuestionsScreenBuilder(
                  currentPage: controller.step.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginQuestionsScreenBuilder extends StatelessWidget {
  final int currentPage;

  const LoginQuestionsScreenBuilder({Key? key, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentPage == 1) {
      return const LoginQuestionsStepOne();
    } else if (currentPage == 2) {
      return const LoginQuestionsStepTwo();
    } else {
      return const LoginQuestionsStepThree();
    }
  }
}
