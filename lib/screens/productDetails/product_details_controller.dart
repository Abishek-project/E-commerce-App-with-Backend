import 'package:ecommerce/screens/productDetails/product_details_variables.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController
    with ProductDetailsVariables {
  init() {
    var data = Get.arguments;
    product.value = data;
    print(product);
  }
}
