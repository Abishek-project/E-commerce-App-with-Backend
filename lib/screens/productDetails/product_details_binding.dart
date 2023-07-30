import 'package:ecommerce/screens/productDetails/product_details_controller.dart';
import 'package:get/get.dart';

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
  }
}
