import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_controller.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_event.dart';
import 'package:cebras_app/presentation/widgets/step_password_widget.dart';
import 'package:cebras_app/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordStep1 extends StatelessWidget {
  const ForgotPasswordStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.find();
    return Obx(
      () => StepPasswordWidget(
        title: 'Digite o seu e-mail para recuperar sua senha',
        buttonTitle: 'RECUPERAR SENHA',
        onTapButton: () {
          controller.dispatchEvent(NextStep());
        },
        child: TextFieldWidget(
          initialValue: controller.email.value,
          onChanged: (v) {
            controller.email.value = v;
          },
          label: 'Email',
          hasError: controller.hasErrorEmail.isTrue,
        ),
        isLoading: controller.isLoading(),
      ),
    );
  }
}
