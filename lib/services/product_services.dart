import 'dart:convert';

import 'package:ecommerce/models/product.dart';

import '../constants/api_url.dart';
import '../controller/global_controller.dart';
import 'package:http/http.dart' as http;

import '../screens/components/common_widget_functions.dart';

class ProductService {
  String url = ApiUrl.baseUrl;
  String rateProduct = ApiUrl.rateProduct;
  var headers = <String, String>{
    "content-type": "application/json; charset=utf-8",
    "auth-token": GlobalController.appUser!.token,
  };

  rateProducts(product, double rating) async {
    try {
      var body = {"id": product.id, "rating": rating};
      http.Response response = await http.post(
        Uri.parse("$url$rateProduct"),
        headers: headers,
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }
}
