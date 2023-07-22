import 'package:ecommerce/screens/home/home_view_binding.dart';
import 'package:ecommerce/screens/home/home_view_controller.dart';
import 'package:ecommerce/screens/main/main_view_controller.dart';
import 'package:get/get.dart';

class MainViewBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MainViewController>(() => MainViewController());
    Get.lazyPut<HomeViewController>(() => HomeViewController());
  }
}
