import 'package:ecommerce/screens/category/category_controller.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
