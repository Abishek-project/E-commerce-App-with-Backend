import '../constants/api_url.dart';
import '../controller/global_controller.dart';
import 'package:http/http.dart' as http;

import '../screens/components/common_widget_functions.dart';

class SearchService {
  String url = ApiUrl.baseUrl;
  String searchProduct = ApiUrl.searchProduct;
  var headers = <String, String>{
    "content-type": "application/json; charset=utf-8",
    "auth-token": GlobalController.appUser.value!.token,
  };
  getSearchProducts(String searchQuery) async {
    try {
      http.Response response = await http
          .get(Uri.parse("$url$searchProduct$searchQuery"), headers: headers);
      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }
}
