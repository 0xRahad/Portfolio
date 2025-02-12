import 'package:get/get.dart';
import 'package:portfolio/features/auth/controller/auth_controller.dart';

class AuthBinding with Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}