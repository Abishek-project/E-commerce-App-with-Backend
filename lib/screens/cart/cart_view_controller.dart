import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/cart/cart_variables.dart';
import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/shared_prefrences.dart';
import '../../models/user.dart';
import '../components/error_handling.dart';

class CartController extends GetxController with CartVariables {
  init() async {
    await getSubTotal();
  }

  getSubTotal() {
    sum.value = 0;
    for (var i = 0; i < GlobalController.appUser.value!.cart.length; i++) {
      sum += GlobalController.appUser.value!.cart[i]["quantity"] *
          GlobalController.appUser.value!.cart[i]["product"]["price"];
    }
  }

  addToCart(addToCartProduct, context) async {
    CommonWidgetFuncions().showOverlayLoader();
    var response = await userServices.addToCart(addToCartProduct);
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      GlobalController.appUser.value = User.fromJson(response.body);
      var token = pref.getString(SharedPreferenceKey.token);
      GlobalController.appUser.value!.token = token.toString();
      Navigator.pop(context);
    } else if (response.statusCode != 200) {
      Navigator.pop(context);
      ErrorHandling.errorHandling(response);
    }
  }

  removeFromCart(addToCartProduct, context) async {
    CommonWidgetFuncions().showOverlayLoader();
    var response = await userServices.removeFromCart(addToCartProduct);
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      GlobalController.appUser.value = User.fromJson(response.body);
      var token = pref.getString(SharedPreferenceKey.token);
      GlobalController.appUser.value!.token = token.toString();
      Navigator.pop(context);
    } else if (response.statusCode != 200) {
      Navigator.pop(context);
      ErrorHandling.errorHandling(response);
    }
  }
}
