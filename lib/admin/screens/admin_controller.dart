import 'package:ecommerce/admin/screens/admin_variables.dart';
import 'package:get/get.dart';

import '../../constants/utils.dart';

class AdminController extends GetxController with AdminVariables {
  changeTabIndex(int value) {
    selectedIndex.value = value;
    update();
  }

  pickImagesFromDevice() async {
    var images = await pickImages();
    productImages.value = images;
    print(productImages.value);
  }
}
