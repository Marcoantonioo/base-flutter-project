import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_controller.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_event.dart';
import 'package:cebras_app/presentation/widgets/password_text_field_widget.dart';
import 'package:cebras_app/presentation/widgets/step_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordStep3 extends StatelessWidget {
  const ForgotPasswordStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.find();
    return Obx(
      () => GenericStepWidget(
        title: 'Digite a sua nova senha',
        buttonTitle: 'ALTERAR SENHA',
        onTapButton: () {
          controller.dispatchEvent(NextStep());
        },
        child: PasswordTextField(
          label: 'Senha',
          onChanged: (v) {
            controller.password.value = v;
          },
          hasError: controller.hasErrorPassword.isTrue,
          initialValue: controller.password.value,
        ),
        isLoading: controller.isLoading(),
      ),
    );
  }
}
