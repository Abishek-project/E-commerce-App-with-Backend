import 'package:ecommerce/screens/ordersDetails/order_details_controller.dart';
import 'package:get/get.dart';

class OrderDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
  }
}
