import 'package:get/get.dart';
import 'package:portfolio/features/home/view/pages/home_page.dart';

import 'routes.dart';

class RoutePages {
  static List<GetPage> ROUTES = [
    GetPage(page: () => HomePage(), name: Routes.homePage),
  ];
}
