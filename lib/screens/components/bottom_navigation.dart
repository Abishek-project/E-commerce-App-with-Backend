import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(
      {Key? key,
      this.onTap,
      required this.currentIndex,
      this.bottomIconOne,
      this.bottomIconThree,
      this.bottomIconTwo})
      : super(key: key);
  final void Function(int)? onTap;
  final int currentIndex;
  final String? bottomIconOne;
  final String? bottomIconTwo;
  final String? bottomIconThree;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        onTap!(value);
      },
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              bottomIconOne!,
              color: currentIndex == 0
                  ? Appcolors.appMainColor
                  : Appcolors.darkGray,
              height: 25,
              width: 25,
            ),
            label: ""),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            bottomIconTwo!,
            color:
                currentIndex == 1 ? Appcolors.appMainColor : Appcolors.darkGray,
            height: 25,
            width: 25,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              bottomIconThree!,
              color: currentIndex == 2
                  ? Appcolors.appMainColor
                  : Appcolors.darkGray,
              height: 25,
              width: 25,
            ),
            label: ""),
      ],
    );
  }
}
