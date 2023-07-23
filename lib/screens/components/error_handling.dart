import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ErrorHandling {
  static void errorHandling(http.Response response) {
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 400:
        Get.showSnackbar(
          GetSnackBar(
            message: '${body["msg"]}',
            duration: const Duration(seconds: 3),
          ),
        );

        break;
      case 500:
        Get.showSnackbar(
          GetSnackBar(
            message: '${body["error"]}',
            duration: const Duration(seconds: 3),
          ),
        );

        break;
      default:
        Get.showSnackbar(
          GetSnackBar(
            message: '$body',
            duration: const Duration(seconds: 3),
          ),
        );
    }
  }
}
