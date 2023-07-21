import 'package:ecommerce/app_routing.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/home/home_view_binding.dart';
import 'package:ecommerce/screens/login&register/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'controller/user_controller.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent,
    ),
  );
  UserController userController = UserController();
  await userController.getUserData();
  // print(GlobalController.appUser);
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Determine the initial route and binding based on user authentication status
  static String determineInitialRoute() {
    return GlobalController.appUser != null &&
            GlobalController.appUser!.token != ""
        ? AppPaths.home
        : AppPaths.login;
  }

  static determineInitialBinding() {
    return GlobalController.appUser != null &&
            GlobalController.appUser!.token != ""
        ? HomeViewBinding()
        : LoginAndRegisterationBinding();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(),
      initialBinding: determineInitialBinding(),
      initialRoute: determineInitialRoute(),
      getPages: AppRoutes.routes,
    );
  }
}
