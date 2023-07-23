import '../constants/api_url.dart';
import '../controller/global_controller.dart';
import 'package:http/http.dart' as http;

import '../screens/components/common_widget_functions.dart';

class HomeService {
  String url = ApiUrl.baseUrl;
  String categoryProduct = ApiUrl.product;
  var headers = <String, String>{
    "content-type": "application/json; charset=utf-8",
    "auth-token": GlobalController.appUser!.token,
  };
  getProductsByCategory(String category) async {
    try {
      http.Response response = await http.get(
          Uri.parse("$url$categoryProduct?category=$category"),
          headers: headers);
      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }
}
