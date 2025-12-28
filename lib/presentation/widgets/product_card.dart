// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/wishlist_screen/wishlist_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

import 'package:savomart/l10n/app_localizations.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.productEntity,
    this.isWishlist = false,
  }) : super(key: key);

  final productEntity;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteList.productDetails, arguments: productEntity.id);
      },
      child: Container(
        height: defaultPadding * 11,
        width: defaultPadding * 9,
        padding: const EdgeInsets.all(defaultPadding * .3),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultPadding * .5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultPadding * .5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(defaultPadding * .5),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.contain,
                      height: defaultPadding * 6.5,
                      imageUrl: productEntity.image.length != 0
                          ? "${productEntity.image[0].imagePath}"
                          : "",
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/no_image.png",
                        height: defaultPadding * 6,
                      ),
                    ),
                  ),
                  if (isWishlist)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultPadding * .5),
                        ),
                        child: InkWell(
                          borderRadius:
                              BorderRadius.circular(defaultPadding * .5),
                          onTap: () {
                            WishlistScreenController wishlistScreenController =
                                Get.find();
                            wishlistScreenController.removFromWhishList(
                                productEntity.id, "remove");
                          },
                          child: const SizedBox(
                              width: defaultPadding,
                              height: defaultPadding,
                              child: Icon(
                                Icons.favorite,
                                size: defaultPadding * .75,
                                color: primaryColor,
                              )),
                        ),
                      ),
                    )
                ],
              ),
            ),
            defaultSpacerSmall,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * .2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const DefaultText(
                  //   title: "Medical Disposable",
                  //   maxLine: 1,
                  //   fontSize: defaultPadding * .5,
                  //   isBold: true,
                  //   color: primaryColor,
                  // ),
                  // const SizedBox(
                  //   height: defaultPadding * .1,
                  // ),
                  DefaultText(
                    title: productEntity.name,
                    maxLine: 2,
                    fontSize: defaultPadding * .6,
                    isBold: true,
                  ),
                  const SizedBox(
                    height: defaultPadding * .25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.price_symbol} " +
                            productEntity.finalPrice,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: defaultPadding * .7,
                            letterSpacing: 0),
                      ),
                      if (double.parse(productEntity.finalPrice) <
                          double.parse(productEntity.price))
                        const SizedBox(
                          width: defaultPadding * .25,
                        ),
                      if (double.parse(productEntity.finalPrice) <
                          double.parse(productEntity.price))
                        Text(
                          "${AppLocalizations.of(context)!.price_symbol} " +
                              productEntity.price,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: primaryColor,
                                  fontSize: defaultPadding * .55,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: primaryColor,
                                  decorationThickness: 1,
                                  letterSpacing: 0),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
