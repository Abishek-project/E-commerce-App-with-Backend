import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/screens/login&register/login_binding.dart';
import 'package:ecommerce/screens/login&register/login_view.dart';
import 'package:ecommerce/screens/login&register/register_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialPage = AppPaths.login;
  static final initialBinding = LoginAndRegisterationBinding();
  static final routes = [
    GetPage(
        name: AppPaths.login,
        page: (() => LoginView()),
        binding: LoginAndRegisterationBinding()),
    GetPage(
        name: AppPaths.registration,
        page: (() => RegistrationView()),
        binding: LoginAndRegisterationBinding())
  ];
}
