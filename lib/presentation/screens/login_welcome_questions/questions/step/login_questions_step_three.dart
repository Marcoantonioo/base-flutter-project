import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_controller.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_event.dart';
import 'package:cebras_app/presentation/widgets/password_text_field_widget.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:cebras_app/presentation/widgets/step_password_widget.dart';
import 'package:cebras_app/presentation/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginQuestionsStepThree
    extends ScreenView<LoginWelcomeQuestionsController> {
  const LoginQuestionsStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GenericStepWidget(
        title: 'Alteração de senha',
        buttonTitle: 'PRÓXIMO',
        onTapButton: () {
          controller.dispatchEvent(NextStep());
        },
        child: Column(
          children: [
            Text(
              'Para a sua segurança, cadastre uma nova senha',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 10),
            PasswordTextField(
              initialValue: controller.password.value,
              onChanged: (v) {
                controller.password.value = v;
              },
              label: 'Senha',
              hasError: controller.hasErrorPassword.isTrue,
            ),
          ],
        ),
        isLoading: controller.isLoading(),
      ),
    );
  }
}
