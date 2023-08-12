import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/empty_orders.dart';
import 'package:ecommerce/screens/components/order_card.dart';
import 'package:ecommerce/screens/orders/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/app_assets.dart';

class OrderView extends GetView<OrderController> {
  OrderView({super.key}) {
    controller.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      AppAssets.backArrow,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.yourOrders,
                    style: AppTypography.appTitle2,
                  ),
                  const Spacer(),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: controller.getOrders(),
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
                          return const EmptyOrdersCard();
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: controller.orderProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return OrderCard(
                            onTap: (() {
                              Get.toNamed(AppPaths.orderDetails,
                                  arguments: controller.orderProducts[index]);
                            }),
                            image: controller
                                .orderProducts[index].products[0].images[0],
                          );
                        },
                      ),
                    );
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
