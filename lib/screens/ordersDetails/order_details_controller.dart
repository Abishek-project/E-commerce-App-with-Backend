import 'package:ecommerce/screens/ordersDetails/order_details_variables.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController with OrderDetailsVaraibles {
  init() async {
    var data = Get.arguments;
    order.value = data;
    currentStep.value = order.value!.status;
  }
}
