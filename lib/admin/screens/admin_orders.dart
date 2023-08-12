import 'package:ecommerce/admin/screens/admin_controller.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/empty_orders.dart';
import 'package:ecommerce/screens/components/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants/app_assets.dart';

class AdminOrderView extends GetView<AdminController> {
  const AdminOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              appBarWidget(),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: controller.getAllOrderProducts(),
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
                        itemCount: controller.allOrderProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.80,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return OrderCard(
                            onTap: (() {
                              Get.toNamed(AppPaths.orderDetails,
                                  arguments:
                                      controller.allOrderProducts[index]);
                            }),
                            image: controller
                                .allOrderProducts[index].products[0].images[0],
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

  Row appBarWidget() {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.backArrow,
          height: 24,
          width: 24,
        ),
        const Spacer(),
        Text(
          AppStrings.yourOrders,
          style: AppTypography.appTitle2,
        ),
        const Spacer(),
      ],
    );
  }
}
