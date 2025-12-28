// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class ProductCardLinear extends StatelessWidget {
  const ProductCardLinear({
    Key? key,
    required this.productEntity,
  }) : super(key: key);

  final productEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultPadding * 5,
      width: double.infinity,
      child: Card(
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(defaultPadding * .5),
          onTap: () => Get.toNamed(RouteList.productDetails),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding * .5),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultPadding * .5),
                  child: CachedNetworkImage(
                    width: defaultPadding * 5,
                    height: defaultPadding * 5,
                    fit: BoxFit.contain,
                    imageUrl: productEntity.image[0].imagePath,
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/bg_splash.png",
                    ),
                  ),
                ),
                defaultSpacerHorizontalSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: defaultPadding * .3,
                      ),
                      Text(
                        "₹" + productEntity.price,
                      ),
                      SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (v) {},
                          starCount: 5,
                          rating: 4.5,
                          size: defaultPadding * .8,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          color: Colors.green,
                          borderColor: Colors.green,
                          spacing: 0.0)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
