import 'package:get/get.dart';
import 'package:portfolio/features/auth/bindings/auth_binding.dart';
import 'package:portfolio/features/auth/view/pages/login_page.dart';
import 'package:portfolio/features/auth/view/pages/signup_page.dart';
import 'package:portfolio/features/home/view/pages/home_page.dart';

import 'routes.dart';

class RoutePages {
  static List<GetPage> ROUTES = [
    GetPage(
        page: () => HomePage(),
        name: Routes.homePage,
        transition: Transition.native),
    GetPage(
        page: () => LoginPage(),
        name: Routes.loginPage,
        binding: AuthBinding(),
        transition: Transition.native),
    GetPage(
        page: () => SignupPage(),
        name: Routes.signupPage,
        binding: AuthBinding(),
        transition: Transition.native),
  ];
}
