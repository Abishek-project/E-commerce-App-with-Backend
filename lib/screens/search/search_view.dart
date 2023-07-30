import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/empty_search_Card.dart';
import 'package:ecommerce/screens/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../models/product.dart';
import '../components/search_card.dart';

class SearchView extends GetView<SerachViewController> {
  SearchView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        AppAssets.backArrow,
                        height: 25,
                        width: 25,
                        color: Appcolors.appBlackDark,
                      ),
                    ),
                    Text(
                      AppStrings.discover,
                      style: AppTypography.appTitle2,
                    ),
                    Stack(
                      children: [
                        SvgPicture.asset(AppAssets.shopBag),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF4848),
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
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.findYourPerfectProduct,
                    style: AppTypography.appSubTitle4
                        .copyWith(color: Appcolors.appBlack),
                  ),
                  SvgPicture.asset(
                    "assets/filter-edit-svgrepo-com.svg",
                    color: Appcolors.appBlack.withOpacity(0.9),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FutureBuilder(
                future:
                    controller.getSearchProducts(controller.searchText.value),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: const EmptySearchCard(),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    RxList<Product> products =
                        RxList.from(snapshot.data as RxList);
                    if (products.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            Product product = controller.searchProducts[index];
                            return Container(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: SearchCard(
                                  onTap: () => Get.offNamed(
                                      AppPaths.productDetails,
                                      arguments: product),
                                  image: product.images[0],
                                  productName: product.name,
                                  productPrice: "\$${product.price}"),
                            );
                          },
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Center(
                          child: Text(
                            AppStrings.noItemsFound,
                            style: AppTypography.appSubTitle4,
                          ),
                        ),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
