import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginAndRegisterationVariable {
  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  final TextEditingController registrationEmail = TextEditingController();
  final TextEditingController registrationPassword = TextEditingController();
  final TextEditingController userName = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  AuthService authService = AuthService();
  RxBool isSignUp = false.obs;
  RxBool isLogin = false.obs;
}
