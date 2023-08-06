import 'package:ecommerce/services/user_services.dart';
import 'package:get/get.dart';

class OrderVariables {
  UserServices userServices = UserServices();
  RxList orderProducts = [].obs;
}
