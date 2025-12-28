import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/screen/product_details/components/product_image_preview.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/params/view_image_args.dart';
import '../../../route/route_constants.dart';
import '../product_details_controller.dart';

class ProductDetailsImageSection extends StatelessWidget {
  const ProductDetailsImageSection({
    Key? key,
    required this.productDetailsController,
  }) : super(key: key);

  final ProductDetailsController productDetailsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteList.viewImageScreen,
                arguments: ViewImageArgs(
                    images: productDetailsController.product!.image!
                        .map((e) => e.imagePath)
                        .toList(),
                    index: productDetailsController.selectedImageIndex));
          },
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * .5),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
            decoration: BoxDecoration(
                color: whiteColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(defaultPadding * .7)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .3,
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: productDetailsController
                    .product!
                    .image![productDetailsController.selectedImageIndex]
                    .imagePath,
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => Image.asset(
                  "assets/no_image.png",
                ),
              ),
            ),
          ),
        ),
        defaultSpacerSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                defaultSpacerHorizontalSmall,
                ...List.generate(
                  productDetailsController.product!.image!.length,
                  (index) => ProductImagePreview(
                    bannerEntity: productDetailsController
                        .product!.image![index].imagePath,
                    productDetailsController: productDetailsController,
                    index: index,
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () {
                productDetailsController
                    .wishlist(productDetailsController.product!.id);
              },
              icon: Icon(
                productDetailsController.favorite.value
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: primaryColor,
              ),
            )
          ],
        )
      ],
    );
  }
}
