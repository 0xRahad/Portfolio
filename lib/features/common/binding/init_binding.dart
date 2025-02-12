import 'package:get/get.dart';
import 'package:portfolio/features/common/service/auth_service.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
  }
}