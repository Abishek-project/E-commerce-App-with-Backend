import 'dart:convert';

import 'package:ecommerce/screens/category/category_variables.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/product.dart';
import '../components/error_handling.dart';

class CategoryController extends GetxController with CategoryVariables {
  init() async {
    var data = Get.arguments;
    category.value = data;
    await getProducts(category.value);
  }

  getProducts(category) async {
    var response = await homeService.getProductsByCategory(category);
    categoryProducts.value = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        categoryProducts.value.add(Product.fromMap(element));
      }
      print(categoryProducts);
      categoryProducts.refresh();
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }
}
