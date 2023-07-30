import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/components/empty_product_card.dart';
import 'package:ecommerce/screens/home/components/category_card.dart';
import 'package:ecommerce/screens/home/components/discount_card.dart';
import 'package:ecommerce/screens/home/components/icon_btn_counter.dart';
import 'package:ecommerce/screens/home/components/search.dart';
import 'package:ecommerce/screens/home/components/section_tile.dart';
import 'package:ecommerce/screens/home/components/special_offers.dart';
import 'package:ecommerce/screens/home/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/product_card.dart';

class Homeview extends GetView<HomeViewController> {
  Homeview({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchWidget(
                      controller: controller.searchController,
                      onSubmitted: (val) =>
                          controller.navigateToSearchView(val.trim()),
                    ),
                    IconBtnWithCounter(
                      svgSrc: AppAssets.cart,
                      press: (() {}),
                    ),
                    IconBtnWithCounter(
                      svgSrc: AppAssets.bell,
                      press: (() {}),
                      numOfitem: 4,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const DiscountBanner(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.categories,
                      style: AppTypography.bodyMedium2,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                // Category widget..
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          controller.allCategories.length,
                          (index) => InkWell(
                                onTap: () => Get.toNamed(AppPaths.category,
                                    arguments: controller.allCategories[index]
                                        ["name"]),
                                child: CategoryCard(
                                  text: controller.allCategories[index]["name"],
                                  icon: controller.allCategories[index]["icon"],
                                  color: index == 0
                                      ? Appcolors.appMainColor
                                      : Appcolors.appWhite,
                                  textColor: index == 0
                                      ? Appcolors.appWhite
                                      : Appcolors.appBlackDark,
                                  border: index == 0
                                      ? null
                                      : Border.all(
                                          color: Appcolors.lightGray11),
                                ),
                              ))
                    ],
                  ),
                ),
                // Special offers header..
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SectionTitle(press: (() {}), title: AppStrings.specialOffers),

                // Special offers widget..
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const SpecialOffers(),

                // Popular products heading..
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SectionTitle(press: (() {}), title: AppStrings.popularProducts),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                // Product card widget..
                // Container(
                //   width: MediaQuery.of(context)
                //       .size
                //       .width, // Ensure the container takes full width
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         ...List.generate(
                //           controller.popularProducts.length,
                //           (index) {
                //             Product product =
                //                 controller.popularProducts.value[index];
                //             return Container(
                //               padding: const EdgeInsets.only(right: 10),
                //               child: ProductCard(
                //                   trailingOnTop: () {},
                //                   svgIcon: AppAssets.heartIcon,
                //                   productTitle: product.name,
                //                   productPrice: "\$${product.price}",
                //                   image: product.images[0]),
                //             );
                //           },
                //         )
                //       ],
                //     ),
                //   ),
                // ),

                // SizedBox(
                //   width: MediaQuery.of(context)
                //       .size
                //       .width, // Ensure the container takes full width
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: controller.popularProducts.length,
                //     itemBuilder: (context, index) {
                //       Product product = controller.popularProducts.value[index];
                //       return Container(
                //         padding: const EdgeInsets.only(right: 10),
                //         width: MediaQuery.of(context).size.width * 0.45,
                //         child: ProductCard(
                //             trailingOnTop: () {},
                //             svgIcon: AppAssets.heartIcon,
                //             productTitle: product.name,
                //             productPrice: "\$${product.price}",
                //             image: product.images[0]),
                //       );
                //     },
                //   ),
                // ),

                FutureBuilder(
                  future: controller.getPopularProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Ensure the container takes full width
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: EmptyProductCard(),
                            );
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
                      return SizedBox(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Ensure the container takes full width
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.popularProducts.length,
                          itemBuilder: (context, index) {
                            Product product =
                                controller.popularProducts.value[index];
                            return Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: ProductCard(
                                  onTap: (() => Get.toNamed(
                                      AppPaths.productDetails,
                                      arguments: product)),
                                  trailingOnTop: () {},
                                  svgIcon: AppAssets.heartIcon,
                                  productTitle: product.name,
                                  productPrice: "\$${product.price}",
                                  image: product.images[0]),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
