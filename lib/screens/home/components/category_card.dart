import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {Key? key,
      required this.text,
      this.color,
      this.textColor,
      this.border,
      required this.icon})
      : super(key: key);
  String text;
  Color? color;
  Color? textColor;
  BoxBorder? border;
  String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(45),
          color: color,
        ),
        child: Center(
          child: Row(
            children: [
              icon == ""
                  ? Container()
                  : SizedBox(
                      height: 18,
                      width: 22,
                      child: Image.asset(icon),
                    ),
              const SizedBox(
                width: 3,
              ),
              Text(text,
                  style:
                      AppTypography.appSubTitlebold.copyWith(color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
