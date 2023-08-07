import 'dart:convert';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:ecommerce/admin/model/sales.dart';
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
  String deleteProduct = ApiUrl.deleteProduct;
  String allOrders = ApiUrl.allOrders;
  String changeStatus = ApiUrl.changeOrderStatus;
  String analytics = ApiUrl.analytics;
  var headers = <String, String>{
    "content-type": "application/json; charset=utf-8",
    "auth-token": GlobalController.appUser.value!.token,
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

  getAllOrderProducts() async {
    try {
      http.Response response =
          await http.post(Uri.parse("$url$allOrders"), headers: headers);

      return response;
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }

  deleteProducts(id) async {
    var body = {"id": id};
    try {
      var response = await http.post(Uri.parse("$url$deleteProduct"),
          body: jsonEncode(body), headers: headers);
      if (response.statusCode != 200) {
        ErrorHandling.errorHandling(response);
      }
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }

  changeOrderStatus(order, status) async {
    var body = {"id": order.id, "status": status};
    try {
      var response = await http.post(Uri.parse("$url$changeStatus"),
          body: jsonEncode(body), headers: headers);
      if (response.statusCode != 200) {
        ErrorHandling.errorHandling(response);
      }
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }

  getEarnings() async {
    List<Sales> sales = [];
    int totalEarning = 0;
    try {
      http.Response response =
          await http.get(Uri.parse("$url$analytics"), headers: headers);
      print(response);
      var res = jsonDecode(response.body);
      totalEarning = res["totalEarnings"];
      sales = [
        Sales("Mobiles", res["mobileEarnings"]),
        Sales("Fashion", res["fashsionEarnings"]),
        Sales("Appliances", res["applianceEarnings"]),
        Sales("Furniture", res["furnitureEarnings"]),
      ];
      return {"sales": sales, "totalEarning": totalEarning};
    } catch (e) {
      CommonWidgetFuncions().showAlertSnackbar(e.toString());
    }
  }
}
