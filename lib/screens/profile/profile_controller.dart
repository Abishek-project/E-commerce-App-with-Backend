import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/screens/profile/profile_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController with ProfileVariables {
  logout(context) async {
    await commonWidgetFuncions.showOverlayLoader();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    // Simulate loading delay
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pop(),
    );
    Get.offAllNamed(AppPaths.login);
  }
}
