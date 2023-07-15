import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  Widget child;

  Button({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        // padding: const EdgeInsets.all(25),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Appcolors.appMainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: child,
      ),
    );
  }
}
