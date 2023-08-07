import 'dart:async';
import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:ecommerce/screens/profile/components/profile_item.dart';
import 'package:ecommerce/screens/profile/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: HalfOvalClipper(),
                  child: Container(
                    height: 200,
                    decoration:
                        const BoxDecoration(color: Appcolors.appMainColor),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 80), //10
                        height: 100, //140
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4, //8
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppAssets.profile),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5), //5
                      Text(
                        GlobalController.appUser.value!.name.toUpperCase(),
                        style: AppTypography.bodyMedium,
                      ),
                      const SizedBox(height: 2), //5
                      Text(
                        GlobalController.appUser.value!.email,
                        style: AppTypography.appSubTitlebold
                            .copyWith(color: Appcolors.appBlack),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            profileMenu(context)
          ],
        ),
      ),
    );
  }

  profileMenu(context) {
    return Column(
      children: [
        ProfileMenuItem(
          iconSrc: AppAssets.orderIcon,
          title: AppStrings.orders,
          press: () async {
            // Show the loading overlay
            await CommonWidgetFuncions().showOverlayLoader();
            // Simulate loading delay
            await Future.delayed(
              const Duration(seconds: 1),
              () => Navigator.of(context).pop(),
            );
            Get.toNamed(AppPaths.orderView);
          },
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileMenuItem(
          iconSrc: AppAssets.wishlist,
          title: AppStrings.wishlist,
          press: () {},
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileMenuItem(
          iconSrc: AppAssets.notification,
          title: AppStrings.notification,
          press: () {},
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileMenuItem(
          iconSrc: AppAssets.logout,
          title: AppStrings.logout,
          press: () async {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                    title: const Text(AppStrings.logout),
                    content: const Text(AppStrings.logoutDescription),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: const Text(AppStrings.cancel),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text(
                          AppStrings.confirm,
                          style: TextStyle(color: Appcolors.lightRed),
                        ),
                        onPressed: () async {
                          await controller.logout(context);
                        },
                      ),
                    ]);
              },
            );
          },
        )
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Appcolors.appMainColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        AppStrings.profile,
        style: AppTypography.bodyMedium2.copyWith(color: Appcolors.appWhite),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.edit,
            style: AppTypography.appSubTitlebold
                .copyWith(color: Appcolors.appWhite),
          ),
        ),
      ],
    );
  }
}

class HalfOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
