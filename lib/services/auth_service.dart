import 'dart:convert';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/constants/shared_prefrences.dart';
import 'package:ecommerce/screens/login&register/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/global_controller.dart';
import '../models/user.dart';

class AuthService {
  String url = ApiUrl.baseUrl;
  String signUpEndpoint = ApiUrl.signUp;
  String signInEndpoint = ApiUrl.signIn;
  String tokenIsValid = ApiUrl.tokenIsValid;

  Future signUp(name, email, password) async {
    var headers = {
      "content-type": "application/json; charset=utf-8",
    };
    var body = {"name": name, "email": email, "password": password};
    try {
      http.Response response = await http.post(
        headers: headers,
        Uri.parse('$url$signUpEndpoint'),
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      Get.put(LoginAndRegisterationController());
      Get.find<LoginAndRegisterationController>().isSignUp.value = false;
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future signIn(email, password) async {
    var headers = {
      "content-type": "application/json; charset=utf-8",
    };
    var body = {"email": email, "password": password};
    try {
      http.Response response = await http.post(
        headers: headers,
        Uri.parse('$url$signInEndpoint'),
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      Get.put(LoginAndRegisterationController());
      Get.find<LoginAndRegisterationController>().isLogin.value = false;
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  getUserData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString(SharedPreferenceKey.token);
      if (token == null) {
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
          return userResponse;
          // var resBody = jsonDecode(userResponse.body);

          // await pref.setString(SharedPreferenceKey.appUser, userResponse.body);

          // GlobalController.appUser = User.fromJson(userResponse.body);
        } else if (tokenResponse == false) {
          return null;
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
