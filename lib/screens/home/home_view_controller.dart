import 'dart:convert';

import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/shared_prefrences.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/home/home_view_variables.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/product.dart';
import '../components/error_handling.dart';

class HomeViewController extends GetxController with HomeViewVariable {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  init() async {
    // await getPopularProducts();
  }

  navigateToSearchView(String searchText) {
    if (searchText != "") {
      Get.toNamed(AppPaths.search, arguments: searchText);
      searchController.clear();
    }
  }

  getPopularProducts() async {
    var response = await HomeService().getPopularProducts();
    popularProducts.value = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        popularProducts.value.add(Product.fromMap(element));
      }

      popularProducts.refresh();

      return popularProducts;
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }
}
