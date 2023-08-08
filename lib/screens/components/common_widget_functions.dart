import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CommonWidgetFuncions {
  showAlertSnackbar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// used for showing page loader during the insertion and updation of data in the database
  Future<void> showOverlayLoader() async {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
            child: SpinKitWave(
          size: 30,
          color: Appcolors.blue,
        )
            //  SizedBox(
            //   width: 45,
            //   height: 45,
            //   child: CircularProgressIndicator(
            //     strokeWidth: 5,
            //   ),
            // ),
            ),
      ),
    );
  }

  checkNetworkConnectivity() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      GlobalController.isNetworkAvailable.value = true;
    } else {
      GlobalController.isNetworkAvailable.value = false;
    }
  }
}
