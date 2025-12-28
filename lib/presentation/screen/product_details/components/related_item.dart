// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/domain/entities/product_entity.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

class RelatedItem extends StatelessWidget {
  const RelatedItem({
    Key? key,
    required this.productEntity,
    this.isRelated = true,
  }) : super(key: key);

  final ProductEntity productEntity;
  final bool isRelated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isRelated) {
          Get.back();
          Get.toNamed(
            RouteList.productDetails,
            arguments: productEntity.id,
            preventDuplicates: true,
          );
        } else {
          Get.toNamed(RouteList.productDetails, arguments: productEntity.id);
        }
      },
      child: Container(
        height: defaultPadding * 10,
        width: defaultPadding * 9,
        padding: const EdgeInsets.all(defaultPadding * .2),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultPadding * .5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultPadding * .5),
              child: CachedNetworkImage(
                width: double.infinity,
                height: defaultPadding * 6,
                fit: BoxFit.contain,
                imageUrl: productEntity.imageUrl,
                errorWidget: (context, url, error) =>
                    Image.asset("assets/no_image.png"),
              ),
            ),
            defaultSpacerSmall,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * .2,
              ),
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
                  const SizedBox(height: defaultPadding * .25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.price_symbol} " +
                            productEntity.price,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontSize: defaultPadding * .7,
                          letterSpacing: 0,
                        ),
                      ),
                      if (productEntity.cutPrice != "")
                        const SizedBox(width: defaultPadding * .25),
                      if (productEntity.cutPrice != "")
                        Text(
                          "${AppLocalizations.of(context)!.price_symbol} " +
                              productEntity.cutPrice!,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: primaryColor,
                                fontSize: defaultPadding * .5,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: primaryColor,
                                decorationThickness: 1,
                                letterSpacing: 0,
                              ),
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
