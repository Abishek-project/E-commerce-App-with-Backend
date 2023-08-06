import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_textStyle.dart';

// ignore: must_be_immutable
class OrderCard extends StatelessWidget {
  OrderCard({required this.image, super.key});
  String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
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
        ),
        const SizedBox(height: 10),
        Text(
          "Tap to view details",
          style: AppTypography.appSubTitlebold,
        ),
      ],
    );
  }
}
