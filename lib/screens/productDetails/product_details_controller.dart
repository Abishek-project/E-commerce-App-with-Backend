import 'dart:convert';

import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/constants/shared_prefrences.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/productDetails/product_details_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

        if (product.value!.rating![i].userId ==
            GlobalController.appUser.value!.id) {
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

  productAddToCart(addToCartProduct, context) async {
    commonWidgetFuncions.showOverlayLoader();
    var response = await userServices.addToCart(addToCartProduct);
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      GlobalController.appUser.value = User.fromJson(response.body);
      var token = pref.getString(SharedPreferenceKey.token);

      GlobalController.appUser.value!.token = token.toString();
      Navigator.pop(context);
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //     title: const Text(
      //       "Successfully added!",
      //     ),
      //     content: const Text("Check Yout Cart"),
      //   ),
      // );
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: const Text("Successfully added !"),
              content: const Text("Check Your Cart"),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // CupertinoDialogAction(
                //   child: Text('OK'),
                //   onPressed: () {
                //     // Perform an action here
                //     Navigator.of(context).pop();
                //   },
                // ),
              ]);
        },
      );

      // Get.showSnackbar(
      //   const GetSnackBar(
      //     message: 'Added to cart',
      //     duration: Duration(seconds: 3),
      //   ),
      // );
    } else if (response.statusCode != 200) {
      Navigator.pop(context);
      ErrorHandling.errorHandling(response);
    }
  }
}
