import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/admin/screens/admin_controller.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/custom_button.dart';
import 'package:ecommerce/screens/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AddProducts extends GetView<AdminController> {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.appMainColor,
          elevation: 0,
          title: Text(
            AppStrings.addProducts,
            style: AppTypography.bodyMedium2,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Selected Products Image.
                  Obx(() => controller.productImages.isNotEmpty
                      ? CarouselSlider(
                          items: controller.productImages.value
                              .map((data) => SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    width: double.infinity,
                                    child: Image.file(
                                      data,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              height: 200),
                        )
                      : InkWell(
                          onTap: () => controller.pickImagesFromDevice(),
                          child: DottedBorder(
                            color: Appcolors.darkGray01,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 40,
                                    color: Appcolors.darkGray01,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Text(
                                    AppStrings.selectProducts,
                                    style: AppTypography.appSubTitle2
                                        .copyWith(color: Appcolors.darkGray),
                                  )
                                ],
                              ),
                            ),
                          ))),
                  // TextFields..
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  TextFieldWidget(
                      controller: controller.productNameController,
                      obscureText: false,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return AppStrings.enterProductName;
                        }
                        return null;
                      },
                      hintText: AppStrings.productName),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFieldWidget(
                    controller: controller.descriptionController,
                    obscureText: false,
                    hintText: AppStrings.description,
                    maxLines: 5,
                    validator: (value) {
                      if (value == "" || value == null) {
                        return AppStrings.enterDescription;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFieldWidget(
                      controller: controller.priceController,
                      obscureText: false,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return AppStrings.enterPrice;
                        }
                        return null;
                      },
                      hintText: AppStrings.price),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFieldWidget(
                      controller: controller.quantityController,
                      obscureText: false,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return AppStrings.enterquantity;
                        }
                        return null;
                      },
                      hintText: AppStrings.quantity),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  // DropDown menu..
                  Obx(
                    () => dropDownWidget(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Button(
                    onTap: () async {
                      if (controller.formKey.currentState!.validate() &&
                          controller.productImages.isNotEmpty) {
                        await controller.addProducts(
                            controller.productNameController.text,
                            controller.descriptionController.text,
                            double.parse(controller.priceController.text),
                            double.parse(controller.quantityController.text),
                            controller.category.value,
                            controller.productImages.value,
                            context);
                      }
                    },
                    child: Center(
                      child: Text(AppStrings.sell,
                          style: AppTypography.bodyMedium2
                              .copyWith(color: Appcolors.appWhite)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding dropDownWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        isExpanded: true,
        style:
            AppTypography.appSubTitle2.copyWith(color: Appcolors.appBlackDark),
        value: controller.category.value,
        items: controller.allCategories.value.map((data) {
          return DropdownMenuItem<String>(
            value: data,
            child: Text(data),
          );
        }).toList(),
        onChanged: (value) {
          controller.category.value = value!;
        },
      ),
    );
  }
}
