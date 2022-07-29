import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:cebras_app/architecture/utils/images.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_controller.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_event.dart';
import 'package:cebras_app/presentation/widgets/button_widget.dart';
import 'package:cebras_app/presentation/widgets/screen_view.dart';
import 'package:flutter/material.dart';

class LoginWelcomeQuestionsScreen
    extends ScreenView<LoginWelcomeQuestionsController> {
  const LoginWelcomeQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppThemeData.lightColorScheme.primary,
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  Images.logo,
                  height: MediaQuery.of(context).size.height / 6,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Bem Vindo',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: AppThemeData.lightColorScheme.secondary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(height: 57),
                  Text(
                    'Responda a avaliação de saúde a seguir, para que o profissional de saúde possa atende-lo melhor.',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              ButtonWidget(
                title: 'COMEÇAR',
                onTap: () => controller.dispatchEvent(Start(context: context)),
                color: AppThemeData.lightColorScheme.secondary.withOpacity(0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
