import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmptySearchCard extends StatelessWidget {
  const EmptySearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(8)),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius: BorderRadius.circular(2)),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius: BorderRadius.circular(2)),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius: BorderRadius.circular(2)),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius: BorderRadius.circular(2)),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius: BorderRadius.circular(2)),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
