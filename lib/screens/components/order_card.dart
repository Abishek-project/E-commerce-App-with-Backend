import 'package:ecommerce/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_textStyle.dart';

// ignore: must_be_immutable
class OrderCard extends StatelessWidget {
  OrderCard({required this.image, required this.onTap, super.key});
  String image;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Appcolors.lightGray13,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    image,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            AppStrings.tapToView,
            style: AppTypography.appSubTitlebold,
          ),
        ],
      ),
    );
  }
}
