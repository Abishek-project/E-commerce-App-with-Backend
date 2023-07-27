import 'dart:async';
import 'dart:convert';

import 'package:ecommerce/screens/search/search_variables.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import '../components/error_handling.dart';

class SerachViewController extends GetxController with SearchViewVariables {
  init() async {
    var data = Get.arguments;
    searchText.value = data;
  }

  getSearchProducts(String searchQuery) async {
    var response = await searchService.getSearchProducts(searchQuery);
    searchProducts.value = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      for (var element in body) {
        searchProducts.value.add(Product.fromMap(element));
      }

      searchProducts.refresh();
      return searchProducts;
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }
}
