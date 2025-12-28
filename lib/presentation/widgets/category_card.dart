import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

import '../../domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteList.categoryProduct,
          arguments: [category, category.id],
        );
      },
      child: Container(
        width: defaultPadding * 5.5,
        height: defaultPadding * 9,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: whiteColor,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultPadding * .5),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: defaultPadding * 7,
                  fit: BoxFit.contain,
                  imageUrl: category.icon,
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/no_image.png", fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * .3),
            DefaultText(
              title: category.name,
              maxLine: 2,
              isBold: true,
              fontSize: defaultPadding * .6,
            ),
          ],
        ),
      ),
    );
  }
}
