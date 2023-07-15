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
        // Get.snackbar(
        //   "",
        //   '${body["msg"]}',
        //   snackPosition: SnackPosition.BOTTOM,
        //   forwardAnimationCurve: Curves.elasticInOut,
        //   reverseAnimationCurve: Curves.easeOut,
        // );
        break;
      case 500:
        Get.showSnackbar(
          GetSnackBar(
            message: '${body["error"]}',
            duration: const Duration(seconds: 3),
          ),
        );
        // Get.snackbar(
        //   "",
        //   '${body["error"]}',
        //   snackPosition: SnackPosition.BOTTOM,
        //   forwardAnimationCurve: Curves.elasticInOut,
        //   reverseAnimationCurve: Curves.easeOut,
        // );
        break;
      default:
        // Get.snackbar(
        //   "",
        //   '$body',
        //   snackPosition: SnackPosition.BOTTOM,
        //   forwardAnimationCurve: Curves.elasticInOut,
        //   reverseAnimationCurve: Curves.easeOut,
        // );
        Get.showSnackbar(
          GetSnackBar(
            message: '$body',
            duration: const Duration(seconds: 3),
          ),
        );
    }
  }
}
