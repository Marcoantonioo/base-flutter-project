import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_controller.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_event.dart';
import 'package:cebras_app/presentation/widgets/step_password_widget.dart';
import 'package:cebras_app/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordStep2 extends StatelessWidget {
  const ForgotPasswordStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.find();
    return Obx(() => StepPasswordWidget(
          title: 'Digite o código de recuperação de senha',
          buttonTitle: 'PRÓXIMO',
          onTapButton: () {
            controller.dispatchEvent(NextStep());
          },
          child: PinCodeTextField(
            controller: TextEditingController(text: controller.optCode.value),
            textInputAction: TextInputAction.done,
            appContext: context,
            length: 4,
            onChanged: (value) {
              controller.optCode.value = value;
            },
            keyboardType: TextInputType.number,
            textStyle: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.grey,
                ),
            pinTheme: PinTheme(
              fieldHeight: 50,
              fieldWidth: 40,
              errorBorderColor: Colors.red,
              activeFillColor: Colors.grey,
              activeColor: Colors.grey,
              inactiveColor: Colors.grey,
              selectedColor: Colors.grey,
            ),
          ),
          isLoading: controller.isLoading(),
        ));
  }
}
