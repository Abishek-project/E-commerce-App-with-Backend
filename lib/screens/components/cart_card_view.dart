import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_textStyle.dart';

class CartCart extends StatelessWidget {
  CartCart({
    required this.productName,
    required this.productPrice,
    required this.image,
    required this.quantity,
    required this.onDecreasePressed,
    required this.onIncreasePressed,
    Key? key,
  }) : super(key: key);
  String productName;
  String productPrice;
  String image;
  int quantity;
  void Function() onIncreasePressed;
  void Function() onDecreasePressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.22,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Appcolors.lightGray13,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.network(
            image,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.06,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: AppTypography.bodyMedium2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                ' \$$productPrice',
                style: AppTypography.appSubTitle3
                    .copyWith(color: Appcolors.appBlack),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Appcolors.darkGray,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onDecreasePressed,
                icon: Icon(
                  Icons.remove,
                  size: 20,
                  color: Appcolors.appBlack,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                quantity.toString(),
                style: AppTypography.appSubTitlebold,
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onIncreasePressed,
                icon: const Icon(
                  Icons.add,
                  size: 20,
                  color: Appcolors.appMainColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
