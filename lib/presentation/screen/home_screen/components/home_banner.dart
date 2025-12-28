import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding * .2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultPadding),
          child: CachedNetworkImage(
            imageUrl: item.image,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Image.asset(
              "assets/no_image.png",
            ),
          ),
        ),
      ),
    );
  }
}
