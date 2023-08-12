import 'dart:convert';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/shared_prefrences.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/screens/components/error_handling.dart';
import 'package:ecommerce/screens/login&register/login_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAndRegisterationController extends GetxController
    with LoginAndRegisterationVariable {
  @override
  void dispose() {
    loginEmail.dispose();
    loginPassword.dispose();
    registrationEmail.dispose();
    registrationPassword.dispose();

    super.dispose();
  }

  void userSignUp(String name, String email, String password, context) async {
    commonWidgetFuncions.showOverlayLoader();
    try {
      http.Response response = await authService.signUp(name, email, password);
      if (response.statusCode != 200) {
        Navigator.pop(context);
        isSignUp.value = false;
        ErrorHandling.errorHandling(response);
      } else if (response.statusCode == 200) {
        isSignUp.value = false;
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString(SharedPreferenceKey.appUser, response.body);
        GlobalController.appUser.value = User.fromJson(response.body);
        Navigator.pop(context);
        Get.offNamed(AppPaths.login);
      }
    } catch (e) {
      isSignUp.value = false;
      Navigator.pop(context);
      commonWidgetFuncions.showAlertSnackbar(e.toString());
    }
  }

  void userSignIn(String email, String password, context) async {
    commonWidgetFuncions.showOverlayLoader();
    try {
      http.Response response = await authService.signIn(email, password);
      if (response.statusCode != 200) {
        Navigator.pop(context);
        isLogin.value = false;
        ErrorHandling.errorHandling(response);
      } else if (response.statusCode == 200) {
        isLogin.value = false;
        SharedPreferences pref = await SharedPreferences.getInstance();
        var resBody = jsonDecode(response.body);
        await pref.setString(SharedPreferenceKey.token, resBody["token"]);
        await pref.setString(SharedPreferenceKey.appUser, response.body);
        var status = await OneSignal.shared.getDeviceState();
        GlobalController.deviceId = status!.userId!;
        await pref.setString(SharedPreferenceKey.devicetoken, status.userId!);
        GlobalController.appUser.value = User.fromJson(response.body);
        Navigator.pop(context);
        GlobalController.appUser.value!.type == "admin"
            ? Get.offAllNamed(AppPaths.adminView)
            : Get.offNamed(AppPaths.mainView);
      }
    } catch (e) {
      isLogin.value = false;
      Navigator.pop(context);
      commonWidgetFuncions.showAlertSnackbar(e.toString());
    }
  }
}
