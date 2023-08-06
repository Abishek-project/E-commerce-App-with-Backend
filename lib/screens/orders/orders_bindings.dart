import 'package:ecommerce/screens/orders/orders_controller.dart';
import 'package:get/get.dart';

class OrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
