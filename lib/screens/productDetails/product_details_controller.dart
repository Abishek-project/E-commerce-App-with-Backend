import 'dart:convert';

import 'package:ecommerce/constants/shared_prefrences.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/productDetails/product_details_variables.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../components/error_handling.dart';

class ProductDetailsController extends GetxController
    with ProductDetailsVariables {
  init() async {
    var data = Get.arguments;
    product.value = data;
    print(product.value);
    await ratingProducts();
  }

  ratingProducts() async {
    if (product.value!.rating != null || product.value!.rating!.isNotEmpty) {
      double totalRating = 0;
      for (var i = 0; i < product.value!.rating!.length; i++) {
        totalRating += product.value!.rating![i].rating;

        if (product.value!.rating![i].userId == GlobalController.appUser!.id) {
          myRating.value = product.value!.rating![i].rating;
        }
      }
      if (totalRating != 0) {
        var length = product.value!.rating!.length;

        avgRating.value = totalRating / length;
      }
    }
  }

  rateTheProducts(product, rating) async {
    var response = await productService.rateProducts(product, rating);
    if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }

  productAddToCart(addToCartProduct) async {
    var response = await userServices.addToCart(addToCartProduct);
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      await pref.setString(SharedPreferenceKey.appUser, response.body);

      GlobalController.appUser = User.fromJson(response.body);
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }
}
