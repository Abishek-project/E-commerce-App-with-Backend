import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/screens/components/rating.dart';
import 'package:flutter/material.dart';
import '../../constants/app_textStyle.dart';

class SearchCard extends StatelessWidget {
  const SearchCard(
      {super.key,
      required this.image,
      required this.productName,
      required this.productPrice});
  final String image;
  final String productName;
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.network(
            image,
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  maxLines: 2,
                  style: AppTypography.appSubTitle6,
                ),
                const SizedBox(
                  height: 2,
                ),
                const StarRating(),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  productPrice,
                  style: AppTypography.appTitle3,
                ),
                Text(
                  AppStrings.eligibleShipping,
                  style: AppTypography.bodyMedium3,
                ),
                Text(AppStrings.inStock,
                    style: AppTypography.appSubTitlebold
                        .copyWith(color: Appcolors.blue)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
