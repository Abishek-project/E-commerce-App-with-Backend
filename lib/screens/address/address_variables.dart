import 'package:ecommerce/services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressVariables {
  TextEditingController flatNameController = TextEditingController();
  TextEditingController areaNameController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  RxString addressToBeUsed = "".obs;
  RxString address = "".obs;
  UserServices userServices = UserServices();
  RxInt totalPrice = 0.obs;
}
