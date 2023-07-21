import 'dart:convert';

import 'package:ecommerce/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/shared_prefrences.dart';
import '../models/user.dart';

class UserController extends GetxController {
  User? user;
  @override
  void onInit() async {
    // await getUserData();
    super.onInit();
  }

  getUserData() async {
    String url = ApiUrl.baseUrl;

    String tokenIsValid = ApiUrl.tokenIsValid;
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString(SharedPreferenceKey.token);
      if (token == null || token == "") {
        pref.setString(SharedPreferenceKey.token, "");
      } else {
        var headers = <String, String>{
          "content-type": "application/json; charset=utf-8",
          "auth-token": token
        };
        http.Response response = await http.post(
          headers: headers,
          Uri.parse('$url$tokenIsValid'),
        );

        var tokenResponse = jsonDecode(response.body);
        if (tokenResponse == true) {
          http.Response userResponse = await http.get(
            headers: headers,
            Uri.parse("$url/"),
          );

          user = User.fromJson(userResponse.body);
          // update();

          await pref.setString(SharedPreferenceKey.appUser, userResponse.body);
          GlobalController.appUser = User.fromJson(userResponse.body);
        } else if (tokenResponse == false) {
          // return null;
        }
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
