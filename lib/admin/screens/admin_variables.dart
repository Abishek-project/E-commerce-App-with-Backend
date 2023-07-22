import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminVariables {
  RxInt selectedIndex = 0.obs;
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  RxString category = "Mobiles".obs;
  RxList<String> allCategories = [
    "Mobiles",
    "Appliances",
    "Fashion",
    "Furniture",
  ].obs;
  RxList productImages = [].obs;
}
