import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/domain/entities/category_entity.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteList.categoryProduct,
          arguments: [category, category.id]),
      child: Container(
        width: defaultPadding * 5,
        height: defaultPadding * 7,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: whiteColor,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultPadding * .5),
                child: CachedNetworkImage(
                  width: defaultPadding * 4.5,
                  height: defaultPadding * 5,
                  fit: BoxFit.contain,
                  imageUrl: category.icon,
                  errorWidget: (context, url, error) => Padding(
                    padding: const EdgeInsets.all(defaultPadding * .5),
                    child: Image.asset(
                      "assets/no_image.png",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: defaultPadding * .2,
            ),
            SizedBox(
              width: defaultPadding * 4.5,
              child: DefaultText(
                title: category.name,
                maxLine: 2,
                fontSize: defaultPadding * .55,
                isBold: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
