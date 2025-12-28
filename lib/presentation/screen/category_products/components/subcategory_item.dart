import 'package:flutter/widgets.dart';
import 'package:savomart/domain/entities/category_entity.dart';
import 'package:savomart/presentation/screen/category_products/category_product_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';

import '../../../widgets/default_text.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    super.key,
    required this.category,
    required this.categoryPrductController,
    required this.index,
  });

  final CategoryEntity category;
  final int index;
  final CategoryPrductController categoryPrductController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        categoryPrductController.changeCategory(index,category);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding * .2),
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding * .4, horizontal: defaultPadding * .6),
        decoration: BoxDecoration(
            color: category.isSelected ? primaryColor : whiteColor,
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(defaultPadding * .3)),
        child: DefaultText(
          title: category.name,
          fontSize: defaultPadding * .7,
          isBold: category.isSelected ? true : false,
          color: category.isSelected ? whiteColor : textColor,
        ),
      ),
    );
  }
}
