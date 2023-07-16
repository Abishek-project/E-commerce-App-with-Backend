import 'dart:convert';

import 'package:ecommerce/screens/auth/auth_view_variables.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/shared_prefrences.dart';
import '../../controller/global_controller.dart';
import '../../models/user.dart';

class AuthController extends GetxController with AuthVariables {
  init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString(SharedPreferenceKey.appUser);
    if (user != null) {
      GlobalController.appUser = User.fromJson(user);
    }

    await getUserdetails();
  }

  getUserdetails() async {
    try {
      if (GlobalController.appUser != null) {
        var reponse = await authService.getUserData();
        if (reponse != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString(SharedPreferenceKey.appUser, reponse.body);
          GlobalController.appUser = User.fromJson(reponse.body);
          FlutterNativeSplash.remove();
        }
      }

      if (GlobalController.appUser == null ||
          GlobalController.appUser!.token == "") {
        FlutterNativeSplash.remove();
      }
    } catch (e) {}
  }
}
