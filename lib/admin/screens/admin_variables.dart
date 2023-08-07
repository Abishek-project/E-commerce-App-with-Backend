import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/admin_services.dart';

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
  AdminService adminService = AdminService();
  final formKey = GlobalKey<FormState>();
  CommonWidgetFuncions commonWidgetFuncions = CommonWidgetFuncions();
  RxList allProducts = [].obs;
  RxList allOrderProducts = [].obs;
  RxInt totalEarning = 0.obs;
  RxList earning = [].obs;
}
