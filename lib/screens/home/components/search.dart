import 'dart:async';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final _debouncer = Debouncer(milliseconds: 500);

  SearchWidget({
    this.onChanged,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Appcolors.lightGray13,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          _debouncer.run(() {
            if (onChanged != null) onChanged!(value);
          });
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search product",
          hintStyle: TextStyle(color: Appcolors.lightGray09),
          prefixIcon: Icon(Icons.search, color: Appcolors.lightGray09),
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  dispose() {
    _timer?.cancel();
  }
}
