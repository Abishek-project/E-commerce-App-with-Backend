import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_textStyle.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
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
              child: Image.asset("assets/ps4_console_blue_1.png"),
            ),
            const SizedBox(height: 10),
            Text(
              "Wireless Controller for PS4",
              style: AppTypography.appSubTitle1,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$68.99",
                    style: AppTypography.bodyMedium2
                        .copyWith(color: Appcolors.appMainColor)),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Appcolors.lightGray13,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/Heart Icon_2.svg",
                      color: const Color(0xFFFF4848)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
