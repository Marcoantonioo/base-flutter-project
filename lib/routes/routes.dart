import 'package:base_flutter_project/presentation/screens/login/login_injector.dart';
import 'package:base_flutter_project/presentation/screens/login/login_screen.dart';
import 'package:base_flutter_project/routes/route_name.dart';
import 'package:get/get.dart';

final List<GetPage> routes = [
  GetPage(
    name: RouteName.login,
    page: () => const LoginScreen(),
    binding: LoginInjector()
  ),
];
