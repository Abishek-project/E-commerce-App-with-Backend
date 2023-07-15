import 'dart:convert';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/screens/login&register/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String url = ApiUrl.baseUrl;
  String signUpEndpoint = ApiUrl.signUp;
  String signInEndpoint = ApiUrl.signIn;

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
}
