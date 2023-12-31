import 'package:ecommerce/admin/screens/add_product.dart';
import 'package:ecommerce/admin/screens/admin_binding.dart';
import 'package:ecommerce/admin/screens/admin_screen.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/screens/address/address_bindings.dart';
import 'package:ecommerce/screens/address/address_view.dart';
import 'package:ecommerce/screens/category/category_binding.dart';
import 'package:ecommerce/screens/category/category_view.dart';
import 'package:ecommerce/screens/home/home_view.dart';
import 'package:ecommerce/screens/home/home_view_binding.dart';
import 'package:ecommerce/screens/login&register/login_binding.dart';
import 'package:ecommerce/screens/login&register/login_view.dart';
import 'package:ecommerce/screens/login&register/register_view.dart';
import 'package:ecommerce/screens/main/main_view.dart';
import 'package:ecommerce/screens/main/main_view_binding.dart';
import 'package:ecommerce/screens/orders/orders_bindings.dart';
import 'package:ecommerce/screens/orders/orders_view.dart';
import 'package:ecommerce/screens/ordersDetails/order_details_bindings.dart';
import 'package:ecommerce/screens/ordersDetails/order_details_view.dart';
import 'package:ecommerce/screens/productDetails/product_details_binding.dart';
import 'package:ecommerce/screens/productDetails/product_details_view.dart';
import 'package:ecommerce/screens/search/search_binding.dart';
import 'package:ecommerce/screens/search/search_view.dart';
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
        page: (() => Homeview()),
        binding: HomeViewBinding()),
    GetPage(
        name: AppPaths.mainView,
        page: () => const MainView(),
        binding: MainViewBinding()),
    GetPage(
        name: AppPaths.adminView,
        page: () => const AdminScreen(),
        binding: AdminBinding()),
    GetPage(
        name: AppPaths.addProducts,
        page: () => const AddProducts(),
        binding: AdminBinding()),
    GetPage(
        name: AppPaths.category,
        page: () => CategoryView(),
        binding: CategoryBinding()),
    GetPage(
        name: AppPaths.search,
        page: () => SearchView(),
        binding: SearchViewBinding()),
    GetPage(
        name: AppPaths.productDetails,
        page: () => ProductDetailsView(),
        binding: ProductDetailsBindings()),
    GetPage(
        name: AppPaths.addressView,
        page: () => AddressView(),
        binding: AddressBinding()),
    GetPage(
        name: AppPaths.orderView,
        page: () => OrderView(),
        binding: OrderBindings()),
    GetPage(
        name: AppPaths.orderDetails,
        page: () => OrderDetailsView(),
        binding: OrderDetailsBindings()),
  ];
}
