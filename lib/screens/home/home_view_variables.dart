import 'package:flutter/material.dart';

class HomeViewVariable {
  final TextEditingController searchController = TextEditingController();
  List allCategories = [
    {"name": "All categories", "icon": ""},
    {"name": "Mobiles", "icon": "assets/smartphone.png"},
    {"name": "Fashion", "icon": "assets/clothes-hanger.png"},
    {"name": "Appliances", "icon": "assets/washing-machine.png"},
    {"name": "Furniture", "icon": "assets/sofa.png"},
  ];
}
