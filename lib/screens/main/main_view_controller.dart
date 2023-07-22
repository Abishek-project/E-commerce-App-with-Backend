import 'package:ecommerce/screens/main/main_view_variables.dart';
import 'package:get/get.dart';

class MainViewController extends GetxController with MainViewVariables {
  changeTabIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
