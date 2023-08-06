import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmptyOrdersCard extends StatelessWidget {
  const EmptyOrdersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300]!, borderRadius: BorderRadius.circular(8)),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.45,
      ),
    );
  }
}
