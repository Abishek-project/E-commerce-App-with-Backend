import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/screens/address/address_variables.dart';
import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/shared_prefrences.dart';
import '../../models/user.dart';
import '../components/error_handling.dart';

class AddressController extends GetxController with AddressVariables {
  @override
  void dispose() {
    flatNameController.dispose();
    areaNameController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    super.dispose();
  }

  init() async {
    var data = Get.arguments;
    totalPrice.value = data;
    address.value = GlobalController.appUser.value!.address;
  }

  userPayNow(context) async {
    bool form = flatNameController.text.isNotEmpty ||
        areaNameController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (form || address.value == "") {
      if (formKey.currentState!.validate()) {
        addressToBeUsed.value =
            "${flatNameController.text.trim()},${areaNameController.text.trim()},${cityController.text.trim()},${pincodeController.text.trim()}";
        CommonWidgetFuncions().showOverlayLoader();
        var response =
            await userServices.saveUserAddress(addressToBeUsed.value);
        if (response.statusCode == 200) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          GlobalController.appUser.value = User.fromJson(response.body);
          var token = pref.getString(SharedPreferenceKey.token);
          GlobalController.appUser.value!.token = token.toString();

          var responseOrder = await userServices.userOrder(
              GlobalController.appUser.value!.cart,
              totalPrice.value,
              addressToBeUsed.value);
          if (responseOrder.statusCode == 200) {
            await userServices.sentNotification(
                "Your order was placed successfully!", "orderScreen");
            GlobalController.appUser.value!.cart = [];

            Navigator.pop(context);
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                    title: const Text(AppStrings.productOrderSuccess),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: const Text(AppStrings.ok),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Get.offAllNamed(AppPaths.mainView);
                        },
                      ),
                    ]);
              },
            );
          } else if (responseOrder.statusCode != 200) {
            Navigator.pop(context);
            ErrorHandling.errorHandling(responseOrder);
          }
        } else if (response.statusCode != 200) {
          Navigator.pop(context);
          ErrorHandling.errorHandling(response);
        }
      }
    } else {
      CommonWidgetFuncions().showOverlayLoader();
      addressToBeUsed.value = address.value;
      var response = await userServices.userOrder(
          GlobalController.appUser.value!.cart,
          totalPrice.value,
          addressToBeUsed.value);

      if (response.statusCode == 200) {
        await userServices.sentNotification(
            "Order successful! You'll soon receive your product",
            "orderScreen");
        Navigator.pop(context);
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
                title: const Text(AppStrings.productOrderSuccess),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text(AppStrings.ok),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.offAllNamed(AppPaths.mainView);
                    },
                  ),
                ]);
          },
        );

        GlobalController.appUser.value!.cart = [];
      } else if (response.statusCode != 200) {
        Navigator.pop(context);
        ErrorHandling.errorHandling(response);
      }
    }
  }
}
