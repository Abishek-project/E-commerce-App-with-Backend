import 'package:ecommerce/services/user_services.dart';
import 'package:get/get.dart';

mixin CartVariables {
  RxInt sum = 0.obs;
  UserServices userServices = UserServices();
}
