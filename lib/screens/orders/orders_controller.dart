import 'dart:convert';

import 'package:ecommerce/models/order.dart';
import 'package:ecommerce/screens/orders/orders_variables.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import '../components/error_handling.dart';

class OrderController extends GetxController with OrderVariables {
  init() async {
    // await getOrders();
  }

  getOrders() async {
    var response = await userServices.getOrders();
    orderProducts.value = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        orderProducts.value.add(Order.fromMap(element));
      }
      orderProducts.refresh();
      // print(orderProducts);
      return orderProducts;
    } else if (response.statusCode != 200) {
      ErrorHandling.errorHandling(response);
    }
  }
}
