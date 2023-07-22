import 'dart:io';

import 'package:get/get.dart';

class AdminService {
  sellProducts(String name, String description, double price, double quantity,
      String category, List<File> images) {
    try {} catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
