import 'package:ecommerce/screens/home/home_view_controller.dart';
import 'package:get/get.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeViewController>(
      () => HomeViewController(),
    );
  }
}
