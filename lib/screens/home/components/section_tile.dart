import 'package:flutter/material.dart';

import '../../../constants/app_textStyle.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: AppTypography.bodyMedium2,
      ),
      GestureDetector(
        onTap: press,
        child: Text(
          "See More",
          style: AppTypography.appSubTitle2.copyWith(color: Color(0xFFBBBBBB)),
        ),
      )
    ]);
  }
}
