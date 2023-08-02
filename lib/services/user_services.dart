import 'dart:convert';

import '../constants/api_url.dart';
import '../controller/global_controller.dart';
import '../screens/components/common_widget_functions.dart';
import 'package:http/http.dart' as http;

class UserServices {
  String url = ApiUrl.baseUrl;
  String addToCartProduct = ApiUrl.addToCart;
  String removeFromCartProduct = ApiUrl.removeFromCart;

  var headers = <String, String>{
    "content-type": "application/json; charset=utf-8",
    "auth-token": GlobalController.appUser.value!.token,
  };
  addToCart(product) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$url$addToCartProduct"),
        headers: headers,
        body: jsonEncode(
          {
            "id": product.id,
          },
        ),
      );
      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }

  removeFromCart(product) async {
    try {
      http.Response response = await http.delete(
        Uri.parse("$url$removeFromCartProduct${product.id}"),
        headers: headers,
      );
      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }
}