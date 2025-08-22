import 'package:ecommerce/services/user_services.dart';
import 'package:get/get.dart';

mixin OrderVariables {
  UserServices userServices = UserServices();
  RxList orderProducts = [].obs;
}
