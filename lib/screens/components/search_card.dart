import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/screens/components/rating.dart';
import 'package:flutter/material.dart';
import '../../constants/app_textStyle.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.image,
    required this.productName,
    required this.productPrice,
    this.onTap,
  });
  final String image;
  final String productName;
  final String productPrice;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Image.network(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName,
                      maxLines: 2,
                      style: AppTypography.appSubTitle4
                          .copyWith(color: Appcolors.appBlackDark)),
                  StarRating(
                    itemsize: 16,
                    starCount: 4,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    productPrice,
                    style: AppTypography.appSubTitle3,
                  ),
                  Text(AppStrings.eligibleShipping,
                      style: AppTypography.bodyMedium3
                          .copyWith(color: Appcolors.darkGray)),
                  Text(AppStrings.inStock,
                      style: AppTypography.appSubTitlebold
                          .copyWith(color: Appcolors.appMainColor)),
                  const Divider()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
