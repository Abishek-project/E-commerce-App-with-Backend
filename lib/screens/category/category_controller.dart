import 'dart:convert';

import 'package:ecommerce/screens/category/category_variables.dart';
import 'package:ecommerce/services/user_services.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../models/product.dart';
import '../components/error_handling.dart';

class CategoryController extends GetxController with CategoryVariables {
  init() async {
    var data = Get.arguments;
    category.value = data;
  }

  getProducts(category) async {
    var response;
    if (category == "All categories") {
      response = await userServices.getAllProducts();
    } else {
      response = await homeService.getProductsByCategory(category);
    }

    categoryProducts.value = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        categoryProducts.value.add(Product.fromMap(element));
      }
      categoryProducts.refresh();

      return categoryProducts;
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }
}
