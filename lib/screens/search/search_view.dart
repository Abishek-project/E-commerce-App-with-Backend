import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/empty_search_Card.dart';
import 'package:ecommerce/screens/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import '../components/search_card.dart';

class SearchView extends GetView<SerachViewController> {
  SearchView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          FutureBuilder(
            future: controller.getSearchProducts(controller.searchText.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.searchProducts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: const EmptySearchCard(),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                RxList<Product> products = RxList.from(snapshot.data as RxList);
                if (products.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        Product product = controller.searchProducts[index];
                        return Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SearchCard(
                              image: product.images[0],
                              productName: product.name,
                              productPrice: "\$${product.price}"),
                        );
                      },
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Text(
                        AppStrings.noItemsFound,
                        style: AppTypography.appSubTitle4,
                      ),
                    ),
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}
