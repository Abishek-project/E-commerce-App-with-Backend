import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../screens/home/components/icon_btn_counter.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.menu),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "Eazy",
                  style: AppTypography.appTitle
                      .copyWith(color: Appcolors.appBlackDark)),
              TextSpan(
                  text: "Buy",
                  style: AppTypography.appTitle
                      .copyWith(color: Appcolors.appMainColor)),
            ],
          ),
        ),
        IconBtnWithCounter(
          svgSrc: AppAssets.bell,
          press: (() {}),
          numOfitem: 4,
        ),
      ],
    );
  }
}
