import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  bool obscureText;
  String hintText;
  Widget prefixIcon;

  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.prefixIcon,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12)),
        fillColor: Appcolors.lightGray13,
        filled: true,
        hintStyle: TextStyle(
          color: Appcolors.lightGray09,
        ),
      ),
    );
  }
}
