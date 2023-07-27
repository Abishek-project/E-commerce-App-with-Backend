import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SearchWidget extends StatelessWidget {
  void Function(String)? onSubmitted;
  TextEditingController? controller;
  SearchWidget({
    this.onSubmitted,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Appcolors.lightGray13,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search product",
          hintStyle: TextStyle(
            color: Appcolors.lightGray09,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Appcolors.lightGray09,
          ),
        ),
      ),
    );
  }
}
