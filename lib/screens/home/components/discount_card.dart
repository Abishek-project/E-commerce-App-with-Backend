import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.03,
        vertical: MediaQuery.of(context).size.height * 0.03,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6476EF),
            Color(0xFFEF646B),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(text: "A Summer Surpise\n"),
            TextSpan(text: "Cashback 20%", style: AppTypography.appTitle2),
          ],
        ),
      ),
    );
  }
}
