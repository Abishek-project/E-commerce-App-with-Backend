import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:ecommerce/controller/global_controller.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/components/common_widget_functions.dart';
import 'package:ecommerce/screens/components/error_handling.dart';
import 'package:http/http.dart' as http;
import '../../constants/api_url.dart';

class AdminService {
  String url = ApiUrl.baseUrl;
  String addProduct = ApiUrl.addProducts;
  String getAllProduct = ApiUrl.getAdminProducts;
  var headers = <String, String>{
    "content-type": "application/json; charset=utf-8",
    "auth-token": GlobalController.appUser!.token,
  };
  Future sellProducts(String name, String description, double price,
      double quantity, String category, List<File> images, context) async {
    List<String> imageUrls = [];
    try {
      final cloudinary = Cloudinary.signedConfig(
          cloudName: "dgigzwgth",
          apiKey: "949615627688557",
          apiSecret: "EPfQWEJtMCAGil6sbICAYARfZW0");

      for (var element in images) {
        var response = await cloudinary.upload(
            file: element.path,
            fileBytes: element.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
            optParams: {
              'folder': category, // Optional folder to organize images
            },
            progressCallback: (count, total) {
              print('Uploading image from file with progress: $count/$total');
            });

        imageUrls.add(response.secureUrl.toString());
      }
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
    Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price);

    try {
      http.Response response = await http.post(
        Uri.parse('$url$addProduct'),
        headers: headers,
        body: product.toJson(),
      );
      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }

  getAllProducts() async {
    try {
      http.Response response =
          await http.post(Uri.parse("$url$getAllProduct"), headers: headers);

      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }
}
