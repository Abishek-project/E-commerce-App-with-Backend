import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/screens/auth/auth_view.dart';
import 'package:ecommerce/screens/auth/auth_view_binding.dart';
import 'package:ecommerce/screens/home/home_view.dart';
import 'package:ecommerce/screens/home/home_view_binding.dart';
import 'package:ecommerce/screens/login&register/login_binding.dart';
import 'package:ecommerce/screens/login&register/login_view.dart';
import 'package:ecommerce/screens/login&register/register_view.dart';
import 'package:ecommerce/screens/splashscreen/splash_view.dart';
import 'package:ecommerce/screens/splashscreen/splash_view_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialPage = AppPaths.auth;
  static final initialBinding = AuthBinding();
  static final routes = [
    GetPage(
        name: AppPaths.splash,
        page: (() => SplashScreen()),
        binding: SplashBinding()),
    GetPage(
        name: AppPaths.auth, page: (() => AuthView()), binding: AuthBinding()),
    GetPage(
      name: AppPaths.login,
      page: (() => LoginView()),
      binding: LoginAndRegisterationBinding(),
    ),
    GetPage(
        name: AppPaths.registration,
        page: (() => RegistrationView()),
        binding: LoginAndRegisterationBinding()),
    GetPage(
        name: AppPaths.home,
        page: (() => Homeview()),
        binding: HomeViewBinding()),
  ];
}
