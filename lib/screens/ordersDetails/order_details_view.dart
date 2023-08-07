import 'package:ecommerce/admin/services/admin_services.dart';
import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/ordersDetails/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  OrderDetailsView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset(
                    AppAssets.backArrow,
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    AppStrings.viewOrderDetails,
                    style: AppTypography.appTitle2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                orderDetails(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    AppStrings.purchaseDetails,
                    style: AppTypography.appTitle2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                  ),
                  child: orderProducts(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    AppStrings.tracking,
                    style: AppTypography.appTitle2,
                  ),
                ),
                Obx(
                  () => orderStatusWidget(),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column orderProducts() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < controller.order.value!.products.length; i++)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.network(
                  controller.order.value!.products[i].images[0],
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.order.value!.products[i].name,
                      style: AppTypography.bodyMedium2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Qty: ${controller.order.value!.quantity[i]}',
                      style: AppTypography.appSubTitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  Container orderDetails() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Date:     ${DateFormat().format(
              DateTime.fromMillisecondsSinceEpoch(
                  controller.order.value!.orderedAt),
            )}',
            style: AppTypography.appSubTitle1,
          ),
          Text(
            'Order ID:          ${controller.order.value!.id}',
            style: AppTypography.appSubTitle1,
          ),
          Text(
            'Order Total:     ₹${controller.order.value!.totalPrice}',
            style: AppTypography.appSubTitle1,
          ),
        ],
      ),
    );
  }

  orderStatusWidget() {
    return Stepper(
      currentStep: controller.currentStep.value,
      controlsBuilder: (context, details) {
        if (GlobalController.appUser.value!.type == 'admin') {
          return ElevatedButton(
            onPressed: () async {
              // ignore: unrelated_type_equality_checks
              if (controller.currentStep != 3) {
                await AdminService().changeOrderStatus(
                    controller.order.value, controller.order.value!.status + 1);
                controller.currentStep + 1;
              }
            },
            child: const Text(AppStrings.done),
          );
        } else {
          return Container();
        }
      },
      steps: [
        Step(
          title: const Text('Pending'),
          content: const Text(
            'Your order is yet to be delivered',
          ),
          isActive: controller.currentStep.value > 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text('Dispatched'),
          content: const Text(
            'Your order has been Dispatched',
          ),
          isActive: controller.currentStep.value > 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text('Completed'),
          content: const Text(
            'Your order has been completed and Not signed by you.',
          ),
          isActive: controller.currentStep.value > 2,
          state: controller.currentStep.value > 2
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text('Delivered'),
          content: const Text(
            'Your order has been delivered and signed by you!',
          ),
          isActive: controller.currentStep.value >= 3,
          state: controller.currentStep.value >= 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ],
    );
  }
}
