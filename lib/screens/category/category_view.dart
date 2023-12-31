import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/screens/category/category_controller.dart';
import 'package:ecommerce/screens/components/empty_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      appBar: appBar(),
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
                    "keep shopping for ${controller.category.value}!",
                    style: AppTypography.appSubTitle4
                        .copyWith(color: Appcolors.appBlack),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              FutureBuilder(
                future: controller.getProducts(controller.category.value),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          return EmptyProductCard();
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    // RxList<Product> products =
                    //     RxList.from(snapshot.data as RxList);
                    // If data has been fetched successfully, show the list
                    return Obx(() => Expanded(
                          child: GridView.builder(
                            itemCount: controller.categoryProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              Product product =
                                  controller.categoryProducts[index];
                              return ProductCard(
                                  trailingOnTop: () {},
                                  onTap: () {
                                    Get.toNamed(AppPaths.productDetails,
                                            arguments: product)!
                                        .then((value) => controller.getProducts(
                                            controller.category.value));
                                  },
                                  svgIcon: AppAssets.heartIcon,
                                  productTitle: product.name,
                                  productPrice: "\₹${product.price}",
                                  image: product.images[0]);
                            },
                          ),
                        ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Appcolors.appMainColor,
      elevation: 0,
      title: Text(
        controller.category.value,
        style: AppTypography.bodyMedium2,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 5),
          child: SvgPicture.asset(
            AppAssets.shopBag,
            height: 22,
            width: 22,
            color: Appcolors.appWhite,
          ),
        )
      ],
    );
  }
}
