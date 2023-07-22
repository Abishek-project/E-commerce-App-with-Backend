import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/screens/home/home_view.dart';
import 'package:ecommerce/screens/home/home_view_binding.dart';
import 'package:ecommerce/screens/login&register/login_binding.dart';
import 'package:ecommerce/screens/login&register/login_view.dart';
import 'package:ecommerce/screens/login&register/register_view.dart';
import 'package:ecommerce/screens/main/main_view.dart';
import 'package:ecommerce/screens/main/main_view_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  // static const initialPage = AppPaths.auth;
  // static final initialBinding = AuthBinding();
  static final routes = [
    // GetPage(
    //     name: AppPaths.splash,
    //     page: (() => SplashScreen()),
    //     binding: SplashBinding()),
    // GetPage(
    //     name: AppPaths.auth, page: (() => AuthView()), binding: AuthBinding()),
    GetPage(
      name: AppPaths.login,
      page: (() => const LoginView()),
      binding: LoginAndRegisterationBinding(),
    ),
    GetPage(
        name: AppPaths.registration,
        page: (() => const RegistrationView()),
        binding: LoginAndRegisterationBinding()),
    GetPage(
        name: AppPaths.home,
        page: (() => const Homeview()),
        binding: HomeViewBinding()),
    GetPage(
        name: AppPaths.mainView,
        page: () => const MainView(),
        binding: MainViewBinding())
  ];
}
