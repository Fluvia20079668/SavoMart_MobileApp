import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/widgets/category_name_with_button.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/screen/home_screen/components/category_item.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:get/get.dart';

import '../../../core/navigation_screen/navigation_screen_controller.dart';
import '../../../core/navigation_screen/screens.dart';
import '../../../route/route_constants.dart';
import '../home_screen_controller.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    Key? key,
    required this.homeScreenController,
  }) : super(key: key);

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryNamewithButton(
          text: AppLocalizations.of(context)!.categories,
          onTap: () {
            Get.until((route) => Get.currentRoute == RouteList.initial);
            Get.find<NavigationScreenController>()
                .changeScreen(Screens.categories.index);
          },
          buttonText: AppLocalizations.of(context)!.see_all,
        ),
        defaultSpacerSmall,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                homeScreenController.categoryItems.length,
                (index) => Container(
                  margin: const EdgeInsets.only(right: defaultPadding * .2),
                  child: CategoryItem(
                    category: homeScreenController.categoryItems[index],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
