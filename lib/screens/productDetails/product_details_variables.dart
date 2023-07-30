import 'package:get/get.dart';

import '../../models/product.dart';

class ProductDetailsVariables {
  Rxn<Product> product = Rxn<Product>();
  RxInt selectedIndex = 0.obs;
}
