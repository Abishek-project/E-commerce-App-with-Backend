import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
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
  const Homeview({super.key});

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
                    const SearchWidget(),
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
                          (index) => CategoryCard(
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
                                    : Border.all(color: Appcolors.lightGray11),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        4,
                        (index) => Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: ProductCard(
                            productTitle: "Wireless Controller for PS4",
                            productPrice: "\$68.99",
                            image:
                                "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          ),
                        ),
                      )
                    ],
                  ),
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
