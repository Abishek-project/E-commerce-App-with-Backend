import 'package:ecommerce/services/home_services.dart';
import 'package:get/get.dart';

class CategoryVariables {
  RxString category = "".obs;
  RxList categoryProducts = [].obs;
  HomeService homeService = HomeService();
}
