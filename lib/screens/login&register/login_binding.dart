import 'package:ecommerce/screens/login&register/login_controller.dart';
import 'package:get/get.dart';

class LoginAndRegisterationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginAndRegisterationController());
  }
}
