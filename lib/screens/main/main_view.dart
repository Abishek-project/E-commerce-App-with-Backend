import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/screens/components/bottom_navigation.dart';
import 'package:ecommerce/screens/home/home_view.dart';
import 'package:ecommerce/screens/main/main_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainViewController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: controller.selectedIndex.value,
        children: [
          Homeview(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBarWidget(
          onTap: (value) => controller.changeTabIndex(value),
          currentIndex: controller.selectedIndex.value,
          bottomIconOne: AppAssets.shopIcon,
          bottomIconTwo: AppAssets.cart,
          bottomIconThree: AppAssets.userIcon,
        ),
      ),
    );
  }
}
