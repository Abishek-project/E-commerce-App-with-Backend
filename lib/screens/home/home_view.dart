import 'package:ecommerce/screens/home/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homeview extends GetView<HomeViewController> {
  Homeview({super.key}) {
    // controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("H O M E"),
          ],
        ),
      ),
    );
  }
}
