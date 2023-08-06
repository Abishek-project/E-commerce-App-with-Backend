import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String iconSrc, title;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Appcolors.lightGray13,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  iconSrc,
                  height: 24,
                  width: 24,
                  color: Appcolors.appMainColor,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: AppTypography.appSubTitle3
                      .copyWith(color: Appcolors.appBlack),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Appcolors.appBlack,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
