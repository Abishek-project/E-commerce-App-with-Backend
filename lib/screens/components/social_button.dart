import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  String iconName;
  SocialButton({
    required this.iconName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CommonWidgetFuncions().showAlertSnackbar(AppStrings.commingSoon);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 10, color: Appcolors.lightGray11),
        ], color: Appcolors.appWhite, shape: BoxShape.circle),
        child: SvgPicture.asset(
          iconName,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
