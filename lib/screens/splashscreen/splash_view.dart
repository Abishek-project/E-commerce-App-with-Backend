// import 'package:ecommerce/constants/app_colors.dart';
// import 'package:ecommerce/screens/splashscreen/splash_view_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// import '../../constants/app_textStyle.dart';

// class SplashScreen extends GetView<SplashController> {
//   SplashScreen({super.key}) {
//     controller.init();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.appWhite,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: animatedIcon(),
//             ),
//             bottomText()
//           ],
//         ),
//       ),
//     );
//   }

//   Container animatedIcon() {
//     return Container(
//       child: Lottie.asset("assets/fWzKFjkXmo.json",
//           height: 350, width: 350, frameRate: FrameRate(60)),
//     );
//   }

//   Align bottomText() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Column(
//         children: [
//           Text(
//             "EazyBuy",
//             style: AppTypography.appTitle,
//           ),
//           const SizedBox(height: 5),
//           Text("Discover. Shop. Enjoy", style: AppTypography.appSubTitle2),
//           const SizedBox(
//             height: 30.0,
//           )
//         ],
//       ),
//     );
//   }
// }
