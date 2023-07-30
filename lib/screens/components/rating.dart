import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatelessWidget {
  StarRating(
      {super.key,
      required this.starCount,
      required this.itemsize,
      required this.initialRating,
      required this.onRatingUpdate});
  int starCount;
  double itemsize;
  double initialRating;
  void Function(double) onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: initialRating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: starCount,
        itemSize: itemsize,
        // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: onRatingUpdate);
  }
}
