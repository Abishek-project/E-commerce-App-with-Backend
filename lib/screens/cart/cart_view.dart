import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/cart/cart_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/cart_card_view.dart';

class CartView extends GetView<CartController> {
  CartView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Check",
                            style: AppTypography.appTitle2
                                .copyWith(color: Appcolors.appBlackDark)),
                        TextSpan(
                            text: "Out",
                            style: AppTypography.appTitle2
                                .copyWith(color: Appcolors.appMainColor)),
                      ],
                    ),
                  ),
                  const Icon(Icons.more_horiz)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.subtotal,
                    style: AppTypography.bodyMedium2
                        .copyWith(color: Appcolors.appBlack),
                  ),
                  Obx(
                    () => Text(
                      "\$${controller.sum.value}",
                      style: AppTypography.bodyMedium2
                          .copyWith(color: Appcolors.appBlackDark),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Obx(() => Expanded(
                    child: ListView.builder(
                      itemCount: GlobalController.appUser.value!.cart.length,
                      itemBuilder: (context, index) {
                        Product cartProduct = Product.fromMap(GlobalController
                            .appUser.value!.cart[index]["product"]);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: [
                              CartCart(
                                productName: cartProduct.name,
                                productPrice: cartProduct.price.toString(),
                                image: cartProduct.images[0],
                                quantity: GlobalController
                                    .appUser.value!.cart[index]["quantity"],
                                onDecreasePressed: () async {
                                  await controller.removeFromCart(
                                      cartProduct, context);
                                },
                                onIncreasePressed: () async {
                                  await controller.addToCart(
                                      cartProduct, context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Appcolors.appMainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        AppStrings.checkout,
                        style: AppTypography.bodyMedium2
                            .copyWith(color: Appcolors.appWhite),
                      ),
                    ),
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
