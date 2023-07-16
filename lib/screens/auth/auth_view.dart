import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/auth/auth_view_controller.dart';
import 'package:ecommerce/screens/home/home_view.dart';
import 'package:ecommerce/screens/home/home_view_controller.dart';
import 'package:ecommerce/screens/login&register/login_controller.dart';
import 'package:ecommerce/screens/login&register/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthController> {
  AuthView({super.key}) {
    controller.init();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (GlobalController.appUser != null &&
            GlobalController.appUser!.token != null &&
            GlobalController.appUser!.token != "") {
          // User has a non-null and non-empty token, navigate to home view
          Get.put(HomeViewController());
          return Homeview();
        } else {
          // User doesn't have a token or it's null or empty, navigate to login view
          Get.put(LoginAndRegisterationController());
          return const LoginView();
        }
      },
    );
  }
}
