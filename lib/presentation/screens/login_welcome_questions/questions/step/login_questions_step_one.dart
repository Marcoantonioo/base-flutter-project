import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_controller.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_event.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:cebras_app/presentation/widgets/step_password_widget.dart';
import 'package:cebras_app/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginQuestionsStepOne
    extends ScreenView<LoginWelcomeQuestionsController> {
  const LoginQuestionsStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GenericStepWidget(
        title: 'Avaliação de saúde',
        buttonTitle: 'PRÓXIMO',
        onTapButton: () {
          controller.dispatchEvent(NextStep());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qual é o seu peso Atual?',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              initialValue: controller.weight.value,
              onChanged: (v) {
                controller.weight.value = v;
              },
              inputType: TextInputType.number,
              label: 'Peso (Kg)',
              hasError: controller.hasErrorWeight.isTrue,
            ),
            const SizedBox(height: 40),
            Text(
              'Qual é a sua altura?',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              initialValue: controller.height.value,
              onChanged: (v) {
                controller.height.value = v;
              },
              inputType: TextInputType.number,
              label: 'Altura (m)',
              hasError: controller.hasErrorHeight.isTrue,
            ),
          ],
        ),
        isLoading: controller.isLoading(),
      ),
    );
  }
}
