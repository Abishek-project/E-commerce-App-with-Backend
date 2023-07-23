import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_textStyle.dart';

class ProductCard extends StatelessWidget {
  String productTitle;
  String productPrice;
  String image;
  String svgIcon;
  Color? svgColor;
  void Function() trailingOnTop;
  ProductCard(
      {Key? key,
      required this.productTitle,
      required this.svgIcon,
      required this.trailingOnTop,
      this.svgColor,
      required this.productPrice,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
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
        const SizedBox(height: 10),
        Text(
          productTitle,
          // "Wireless Controller for PS4",
          style: AppTypography.appSubTitle1,
          maxLines: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productPrice,
                // "\$68.99",
                style: AppTypography.bodyMedium2
                    .copyWith(color: Appcolors.appMainColor)),
            Container(
              padding: const EdgeInsets.all(8),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Appcolors.lightGray13,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: trailingOnTop,
                child: SvgPicture.asset(
                  svgIcon,
                  height: 24,
                  width: 24,
                  color: svgColor,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
