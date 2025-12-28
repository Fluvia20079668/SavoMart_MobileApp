import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/params/view_image_args.dart';
import '../../../route/route_constants.dart';
import '../../../theme/theme.dart';

class DetailsBannerItem extends StatelessWidget {
  const DetailsBannerItem({
    super.key,
    required this.item,
    required this.images,
    required this.index,
  });

  final String item;
  final List<String> images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteList.viewImageScreen,
            arguments: ViewImageArgs(images: images, index: index));
      },
      child: Container(
        padding: const EdgeInsets.all(defaultPadding * .5),
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(defaultPadding * .7)),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .3,
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
              imageUrl: item,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(defaultPadding * .5),
                    child: Image.asset(
                      "assets/no_image.png",
                    ),
                  )),
        ),
      ),
    );
  }
}
