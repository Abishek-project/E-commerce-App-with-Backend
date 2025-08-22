import 'package:ecommerce/models/order.dart';
import 'package:get/get.dart';

mixin OrderDetailsVaraibles {
  Rxn<Order> order = Rxn<Order>();
  RxInt currentStep = 0.obs;
}
