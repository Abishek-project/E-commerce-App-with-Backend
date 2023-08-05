import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  bool obscureText;
  String hintText;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  Color? prefixIconColor;
  int? maxLines;
  FocusNode? focusNode;
  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.obscureText,
      this.prefixIcon,
      this.validator,
      this.prefixIconColor,
      this.maxLines = 1,
      this.focusNode,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
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
