import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  String buttonText;
  Button({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Appcolors.appMainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
