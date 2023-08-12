import 'package:ecommerce/models/user.dart';
import 'package:get/get.dart';

class GlobalController {
  // static User? appUser;
  static Rxn<User> appUser = Rxn<User>();
  static RxBool isNetworkAvailable = false.obs;
  static String deviceId = "";
  static String oneSignalId = "f4984ec5-d389-4fcb-b8a2-8bdf26b9f68b";
}
