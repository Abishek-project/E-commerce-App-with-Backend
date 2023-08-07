import 'dart:convert';

import 'package:ecommerce/admin/screens/admin_variables.dart';
import 'package:ecommerce/models/order.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/utils.dart';
import '../../screens/components/error_handling.dart';

class AdminController extends GetxController with AdminVariables {
  @override
  void dispose() {
    priceController.dispose();
    quantityController.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  init() async {
    await getAllAdminAddedProducts();
    await allEarnings();
  }

  changeTabIndex(int value) {
    selectedIndex.value = value;
    update();
  }

  pickImagesFromDevice() async {
    var images = await pickImages();
    productImages.value = images;
  }

  addProducts(
      name, description, price, quantity, category, images, context) async {
    commonWidgetFuncions.showOverlayLoader();
    http.Response response = await adminService.sellProducts(
        name, description, price, quantity, category, images, context);

    if (response.statusCode == 200) {
      productNameController.clear();
      descriptionController.clear();
      priceController.clear();
      quantityController.clear();
      productImages.value = [];
      await getAllAdminAddedProducts();
      Navigator.pop(context);

      commonWidgetFuncions.showAlertSnackbar("Product added successfully!");
      Navigator.pop(context);
    } else if (response.statusCode != 200) {
      Navigator.of(Get.overlayContext!).pop();
      ErrorHandling.errorHandling(response);
    }
  }

  getAllAdminAddedProducts() async {
    http.Response response = await adminService.getAllProducts();
    allProducts.value = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        allProducts.value.add(Product.fromMap(element));
      }
      allProducts.refresh();
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }

  getAllOrderProducts() async {
    http.Response response = await adminService.getAllOrderProducts();
    allOrderProducts.value = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        allOrderProducts.value.add(Order.fromMap(element));
      }
      allOrderProducts.refresh();
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }

  deleteProducts(id, index) async {
    await adminService.deleteProducts(id);
    allProducts.removeAt(index);
    allProducts.refresh();
  }

  allEarnings() async {
    var response = await adminService.getEarnings();
    totalEarning.value = response["totalEarning"];
    earning.value = response["sales"];
    print(earning);
  }
}
