import 'package:ecommerce/screens/address/address_controller.dart';
import 'package:get/get.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AddressController>(() => AddressController());
  }
}
