import 'package:ecommerce/screens/category/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_textStyle.dart';
import '../../models/product.dart';
import '../components/product_card.dart';

class CategoryView extends GetView<CategoryController> {
  CategoryView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.appMainColor,
        elevation: 0,
        title: Text(
          controller.category.value,
          style: AppTypography.bodyMedium2,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "keep shoping for ${controller.category.value}!",
                    style: AppTypography.appSubTitle4
                        .copyWith(color: Appcolors.appBlack),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Obx(() => controller.categoryProducts.isEmpty
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
                        itemCount: controller.categoryProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          // ignore: invalid_use_of_protected_member
                          Product product =
                              controller.categoryProducts.value[index];
                          return ProductCard(
                              trailingOnTop: () {},
                              svgIcon: AppAssets.heartIcon,
                              // svgColor: Appcolors.brandRed500,
                              productTitle: product.name,
                              productPrice: "\$${product.price}",
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
