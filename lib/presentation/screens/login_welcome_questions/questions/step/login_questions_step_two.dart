import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_controller.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_event.dart';
import 'package:cebras_app/presentation/widgets/checkbox_widget.dart';
import 'package:cebras_app/presentation/widgets/radio_widget.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:cebras_app/presentation/widgets/step_password_widget.dart';
import 'package:cebras_app/presentation/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginQuestionsStepTwo
    extends ScreenView<LoginWelcomeQuestionsController> {
  const LoginQuestionsStepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GenericStepWidget(
        title: 'Formulários de saúde',
        buttonTitle: 'PRÓXIMO',
        onTapButton: () {
          controller.dispatchEvent(NextStep());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Você possui alguma dessas doenças crônicas?',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            ...List.generate(controller.chronicDiseases.length, (index) {
              return CheckBoxWidget(
                title: controller.chronicDiseases[index].title,
                onChanged: (v) {
                  if (controller.isLoading()) {
                    return;
                  }
                  if (v == true) {
                    controller
                        .addChronicDisease(controller.chronicDiseases[index]);
                  } else {
                    controller.removeChronicDisease(
                        controller.chronicDiseases[index]);
                  }
                },
                isChecked: controller.chronicDiseasesSelecteds
                    .contains(controller.chronicDiseases[index]),
              );
            }),
            const SizedBox(height: 30),
            Text(
              'Você é fumante?',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioWidget(
                  title: 'Sim',
                  isChecked: controller.isSmoker.isTrue,
                  onTap: () {
                    if (controller.isLoading()) {
                      return;
                    }
                    controller.isSmoker(true);
                    controller.noSmoker(false);
                  },
                ),
                const SizedBox(width: 10),
                RadioWidget(
                  title: 'Não',
                  isChecked: controller.noSmoker.isTrue,
                  onTap: () {
                    if (controller.isLoading()) {
                      return;
                    }
                    controller.isSmoker(false);
                    controller.noSmoker(true);
                  },
                ),
              ],
            )
          ],
        ),
        isLoading: controller.isLoading(),
      ),
    );
  }
}
