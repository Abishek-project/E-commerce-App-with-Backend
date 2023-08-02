import 'package:ecommerce/models/user.dart';
import 'package:get/get.dart';

class GlobalController {
  // static User? appUser;
  static Rxn<User> appUser = Rxn<User>();
}
