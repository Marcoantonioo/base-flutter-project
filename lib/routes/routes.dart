import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_injector.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:cebras_app/presentation/screens/login/login_injector.dart';
import 'package:cebras_app/presentation/screens/login/login_screen.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_controller.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_injector.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_screen.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/questions/login_questions_screen.dart';
import 'package:cebras_app/presentation/screens/splash/splash_injector.dart';
import 'package:cebras_app/presentation/screens/splash/splash_screen.dart';
import 'package:cebras_app/routes/route_name.dart';
import 'package:get/get.dart';

final List<GetPage> routes = [
  GetPage(
      name: RouteName.login,
      page: () => const LoginScreen(),
      binding: LoginInjector()),
  GetPage(
    name: RouteName.splash,
    page: () => const SplashScreen(),
    binding: SplashInjector(),
  ),
  GetPage(
      name: RouteName.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordInjector(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200)),
  GetPage(
      name: RouteName.loginWelcome,
      page: () => const LoginWelcomeQuestionsScreen(),
      binding: LoginWelcomeQuestionsInjector(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200)),
  GetPage(
      name: RouteName.loginWelcomeQuestions,
      page: () => const LoginQuestionsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200)),
];
