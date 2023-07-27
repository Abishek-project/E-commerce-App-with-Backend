import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/shared_prefrences.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/home/home_view_variables.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewController extends GetxController with HomeViewVariable {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  init() async {
    print(GlobalController.appUser);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString(SharedPreferenceKey.token);
    print(token);
    var user = preferences.getString(SharedPreferenceKey.appUser);
    print(user);
  }

  navigateToSearchView(String searchText) {
    Get.toNamed(AppPaths.search, arguments: searchText);
    searchController.clear();
  }
}
