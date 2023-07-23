import 'package:ecommerce/admin/screens/admin_controller.dart';
import 'package:ecommerce/admin/screens/posts_screen.dart';
import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/screens/components/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends GetView<AdminController> {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: controller.selectedIndex.value,
        children: [
          PostsScreen(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBarWidget(
            currentIndex: controller.selectedIndex.value,
            onTap: (value) => controller.changeTabIndex(value),
            bottomIconOne: AppAssets.home,
            bottomIconTwo: AppAssets.graph,
            bottomIconThree: AppAssets.inbox),
      ),
    );
  }
}
