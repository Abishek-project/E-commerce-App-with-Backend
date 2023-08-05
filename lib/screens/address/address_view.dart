import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/screens/address/address_controller.dart';
import 'package:ecommerce/screens/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_textStyle.dart';

class AddressView extends GetView<AddressController> {
  AddressView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).requestFocus(FocusNode());
        }),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_outlined),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Add",
                                style: AppTypography.appTitle2
                                    .copyWith(color: Appcolors.appBlackDark)),
                            TextSpan(
                                text: "ress",
                                style: AppTypography.appTitle2
                                    .copyWith(color: Appcolors.appMainColor)),
                          ],
                        ),
                      ),
                      const Icon(Icons.location_on)
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Obx(() => controller.address.value != null &&
                            controller.address != ""
                        ? Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Appcolors.appMainColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.location,
                                        color: Appcolors.appBlack),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.deliveringTo,
                                            style: AppTypography.appSubTitlebold
                                                .copyWith(
                                                    color: Appcolors
                                                        .appMainColor
                                                        .withOpacity(0.9)),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                            controller.address.value,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTypography.appSubTitle3
                                                .copyWith(
                                                    color:
                                                        Appcolors.appBlackDark),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          controller.focusNode.requestFocus(),
                                      child: Text(
                                        AppStrings.edit,
                                        style: AppTypography.appSubTitlebold
                                            .copyWith(
                                                color: Appcolors.appMainColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container())),
                Obx(() => controller.address.value != null &&
                        controller.address.value != ""
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: Appcolors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppStrings.or,
                              style: AppTypography.appSubTitle2
                                  .copyWith(color: Appcolors.lightGray09),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: Appcolors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                            focusNode: controller.focusNode,
                            controller: controller.flatNameController,
                            obscureText: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your Flat or House no";
                              }
                              return null;
                            },
                            hintText: "Flat, House no.Building"),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldWidget(
                            controller: controller.areaNameController,
                            obscureText: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your Area and Street";
                              }
                              return null;
                            },
                            hintText: "Area, Street"),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldWidget(
                            controller: controller.pincodeController,
                            obscureText: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your Pincode";
                              }
                              return null;
                            },
                            hintText: "Pincode"),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldWidget(
                            controller: controller.cityController,
                            obscureText: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter Town or City";
                              }
                              return null;
                            },
                            hintText: "Town/City"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Appcolors.appMainColor.withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              await controller.userPayNow(context);
                              controller.flatNameController.clear();
                              controller.areaNameController.clear();
                              controller.pincodeController.clear();
                              controller.cityController.clear();
                            },
                            child: const Text(AppStrings.payNow),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
