import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:ecommerce/services/user_services.dart';
import 'package:get/get.dart';

import '../../models/product.dart';

class ProductDetailsVariables {
  Rxn<Product> product = Rxn<Product>();
  RxInt selectedIndex = 0.obs;
  ProductService productService = ProductService();
  RxDouble avgRating = 0.0.obs;
  RxDouble myRating = 0.0.obs;
  UserServices userServices = UserServices();
  CommonWidgetFuncions commonWidgetFuncions = CommonWidgetFuncions();
}
