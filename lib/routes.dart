import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:user_increment/signup_page/signup_page.dart';

import 'home_page/home_page.dart';
import 'login_page/login_page.dart';

class Routes {
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';

  static List<GetPage> routes = [
    // GetPage(name: splash, page: () => const Splash()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const SignUpScreen()),
    GetPage(name: dashboard, page: () => HomePage()),
  ];
}
