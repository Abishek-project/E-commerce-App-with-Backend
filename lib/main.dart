import 'package:ecommerce/admin/screens/admin_binding.dart';
import 'package:ecommerce/app_routing.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:ecommerce/screens/login&register/login_binding.dart';
import 'package:ecommerce/screens/main/main_view_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  await CommonWidgetFuncions().checkNetworkConnectivity();
  if (GlobalController.isNetworkAvailable.value) {
    await userController.getUserData();
  } else {
    CommonWidgetFuncions().showAlertSnackbar("Please Check Your Network !");
  }
  await userController.getUserData();
  // print(GlobalController.appUser);
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Determine the initial route and binding based on user authentication status
  static String determineInitialRoute() {
    return GlobalController.appUser.value != null &&
            GlobalController.appUser.value!.token != "" &&
            GlobalController.appUser.value!.type == "admin"
        ? AppPaths.adminView
        : GlobalController.appUser.value != null &&
                GlobalController.appUser.value!.token != ""
            ? AppPaths.mainView
            : AppPaths.login;
  }

  static determineInitialBinding() {
    return GlobalController.appUser.value != null &&
            GlobalController.appUser.value!.token != "" &&
            GlobalController.appUser.value!.type == "admin"
        ? AdminBinding()
        : GlobalController.appUser.value != null &&
                GlobalController.appUser.value!.token != ""
            ? MainViewBinding()
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
