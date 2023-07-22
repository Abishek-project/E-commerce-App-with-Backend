import 'package:ecommerce/admin/screens/admin_controller.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/admin_header.dart';

class PostsScreen extends GetView<AdminController> {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: AppStrings.addProducts,
        onPressed: () {
          Get.toNamed(AppPaths.addProducts);
        },
        backgroundColor: Appcolors.appMainColor,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const AdminAppBar(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.helloAdmin,
                    style: AppTypography.appTitle2
                        .copyWith(color: Appcolors.appBlack),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
