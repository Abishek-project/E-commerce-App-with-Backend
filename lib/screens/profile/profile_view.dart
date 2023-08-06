import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/profile/components/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
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
                            image: AssetImage("assets/profile.jpeg"),
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
            Column(
              children: [
                ProfileMenuItem(
                  iconSrc: AppAssets.orderIcon,
                  title: AppStrings.orders,
                  press: () {},
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
                  press: () {},
                )
              ],
            )
          ],
        ),
      ),
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
