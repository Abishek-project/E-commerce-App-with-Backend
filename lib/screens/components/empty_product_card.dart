import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmptyProductCard extends StatelessWidget {
  EmptyProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.circular(8)),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.45,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.circular(2)),
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.circular(2)),
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ],
      ),
    );
  }
}
