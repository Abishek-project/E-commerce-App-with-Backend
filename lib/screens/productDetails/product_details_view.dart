import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/custom_button.dart';
import 'package:ecommerce/screens/components/rating.dart';
import 'package:ecommerce/screens/productDetails/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  ProductDetailsView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.lightGray13,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          AppAssets.backArrow,
                          height: 25,
                          width: 25,
                          color: Appcolors.appBlackDark,
                        ),
                      ),
                      Stack(
                        children: [
                          SvgPicture.asset(
                            AppAssets.shopBag,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: Appcolors.appMainColor,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                              ),
                              child: const Center(
                                child: Text(
                                  "4",
                                  style: TextStyle(
                                    fontSize: 10,
                                    height: 1,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider.builder(
                        itemCount: controller.product.value!.images.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return SizedBox(
                            child: Image.network(
                              controller.product.value!.images[index],
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width * 0.45,
                            ),
                          );
                        },
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              controller.selectedIndex.value = index;
                            },
                            height: 200),
                      ),
                      controller.product.value!.images.length > 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.product.value!.images.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Obx(
                                      () => AnimatedContainer(
                                        height:
                                            controller.selectedIndex.value ==
                                                    index
                                                ? 7
                                                : 6,
                                        width: 6,
                                        decoration: BoxDecoration(
                                          color:
                                              controller.selectedIndex.value ==
                                                      index
                                                  ? Appcolors.appMainColor
                                                  : Appcolors.appMainColor
                                                      .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        duration:
                                            const Duration(milliseconds: 300),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Container()
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Appcolors.appWhite,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.product.value!.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.appTitle3,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Obx(() => Text(
                                        controller.avgRating.value
                                            .toStringAsFixed(1),
                                        style: AppTypography.appSubTitlebold
                                            .copyWith(
                                                color: Appcolors.appBlack)))
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 14, bottom: 14),
                              child: Text(AppStrings.description,
                                  style: AppTypography.appSubTitle3),
                            ),
                            Text(
                              controller.product.value!.description,
                              style: AppTypography.appSubTitle7
                                  .copyWith(color: Appcolors.appBlack),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.price,
                                  style: AppTypography.appSubTitle3
                                      .copyWith(color: Appcolors.appBlackDark),
                                ),
                                Text(
                                  "\$${controller.product.value!.price}",
                                  style: AppTypography.appTitle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(AppStrings.rateProduct,
                                style: AppTypography.bodyMedium
                                    .copyWith(color: Appcolors.appBlack)),
                            Obx(() => StarRating(
                                  starCount: 5,
                                  itemsize: 20,
                                  initialRating:
                                      controller.myRating.value.toDouble(),
                                  onRatingUpdate: (val) {
                                    controller.rateTheProducts(
                                        controller.product.value, val);
                                  },
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            Button(
                                onTap: () {},
                                child: Center(
                                    child: Text(AppStrings.addToCart,
                                        style: AppTypography.appSubTitle3
                                            .copyWith(
                                                color: Appcolors.appWhite)))),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
