import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/domain/entities/product_entity.dart';
import 'package:savomart/presentation/screen/product_details/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/route_constants.dart';
import '../../../theme/theme.dart';

class VariantItem extends StatelessWidget {
  const VariantItem({
    super.key,
    required this.variant,
    required this.productDetailsController,
  });

  final ProductEntity variant;
  final ProductDetailsController productDetailsController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.toNamed(RouteList.productDetails,
            arguments: variant.id, preventDuplicates: true);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.width * .4,
        margin: const EdgeInsets.only(right: defaultPadding * .5),
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding * .5, horizontal: defaultPadding * .5),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultPadding * .3),
            border: Border.all(
                color: variant.id == productDetailsController.productId
                    ? primaryColor
                    : greyColor.withOpacity(.5),
                width: variant.id == productDetailsController.productId
                    ? defaultPadding * .1
                    : defaultPadding * .05)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultPadding * .2),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width * .35,
                height: MediaQuery.of(context).size.width * .2,
                fit: BoxFit.cover,
                imageUrl: variant.imageUrl,
                errorWidget: (context, url, error) => Image.asset(
                  "assets/no_image.png",
                ),
              ),
            ),
            const SizedBox(
              height: defaultPadding * .3,
            ),
            Text(
              variant.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                  fontSize: defaultPadding * .6),
            ),
            const SizedBox(
              height: defaultPadding * .2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SR " + variant.price,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                      fontSize: defaultPadding * .65),
                ),
                if (variant.cutPrice != "") defaultSpacerHorizontalSmall,
                if (variant.cutPrice != "")
                  Text(
                    "SR " + variant.cutPrice!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                        fontSize: defaultPadding * .55),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
