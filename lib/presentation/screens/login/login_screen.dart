import 'package:cebras_app/architecture/utils/validators.dart';
import 'package:cebras_app/presentation/screens/login/login_controller.dart';
import 'package:cebras_app/presentation/screens/login/login_event.dart';
import 'package:cebras_app/presentation/widgets/button_widget.dart';
import 'package:cebras_app/presentation/widgets/dismiss_keyboard_on_tap.dart';
import 'package:cebras_app/presentation/widgets/password_text_field_widget.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:cebras_app/presentation/widgets/text_field_widget.dart';
import 'package:cebras_app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends ScreenView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardOnTap(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            top: true,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('name'),
                    Text(
                      'CENTRO BRASILEIRO DE PESQUISA SOBRE\nRESULTADOS EM SAÚDE',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: const Color(0xff666666)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Obx(
                      () => TextFieldWidget(
                        onChanged: (v) {
                          controller.email.value = v;
                        },
                        label: 'Email',
                        hasError: controller.hasErrorEmail.isTrue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => PasswordTextField(
                        onChanged: (v) {
                          controller.password.value = v;
                        },
                        label: 'Senha',
                        validator: Validator.checkEmptyField,
                        hasError: controller.hasErrorPassword.isTrue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.forgotPassword);
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Esqueci minha senha',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: const Color(0xff121429)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Obx(
                      () => ButtonWidget(
                        title: 'LOGIN',
                        onTap: () => controller.dispatchEvent(DoLogin()),
                        isLoading: controller.isLoading(),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
