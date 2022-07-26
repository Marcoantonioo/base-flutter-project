import 'package:cebras_app/presentation/screens/login/login_injector.dart';
import 'package:cebras_app/presentation/screens/login/login_screen.dart';
import 'package:cebras_app/routes/route_name.dart';
import 'package:get/get.dart';

final List<GetPage> routes = [
  GetPage(
    name: RouteName.login,
    page: () => const LoginScreen(),
    binding: LoginInjector()
  ),
];
