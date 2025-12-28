import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import '../product_details_controller.dart';

class ProductImagePreview extends StatelessWidget {
  const ProductImagePreview({
    Key? key,
    required this.bannerEntity,
    required this.productDetailsController,
    required this.index,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final  bannerEntity;
  final ProductDetailsController productDetailsController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => productDetailsController.chnageImagePreview(index),
      child: Container(
        margin: const EdgeInsets.only(right: defaultPadding * .2),
        padding: const EdgeInsets.all(defaultPadding * .3),
        width: defaultPadding * 2.5,
        height: defaultPadding * 2.5,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultPadding * .3),
            border: Border.all(
                color: index == productDetailsController.selectedImageIndex
                    ? primaryColor
                    : Colors.transparent)),
        child: CachedNetworkImage(
          imageUrl: bannerEntity,
          fit: BoxFit.contain,
          errorWidget: (context, url, error) => Image.asset(
            "assets/no_image.png",
          ),
        ),
      ),
    );
  }
}
