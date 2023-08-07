import 'package:ecommerce/admin/screens/admin_controller.dart';
import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import '../components/admin_header.dart';

class PostsScreen extends GetView<AdminController> {
  PostsScreen({super.key}) {
    controller.init();
  }

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
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Obx(() => controller.allProducts.isEmpty
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: controller.allProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          // ignore: invalid_use_of_protected_member
                          Product product = controller.allProducts.value[index];
                          return ProductCard(
                              trailingOnTop: (() async {
                                await controller.deleteProducts(
                                    product.id, index);
                              }),
                              svgIcon: AppAssets.trashIcon,
                              svgColor: Appcolors.brandRed500,
                              productTitle: product.name,
                              productPrice: "\₹${product.price}",
                              image: product.images[0]);
                        },
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
