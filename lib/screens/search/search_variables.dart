import 'package:ecommerce/services/search_service.dart';
import 'package:get/get.dart';

class SearchViewVariables {
  RxString searchText = "".obs;
  RxList searchProducts = [].obs;
  SearchService searchService = SearchService();
}
