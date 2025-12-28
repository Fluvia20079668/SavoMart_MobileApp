import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/category_name_with_button.dart';
import 'package:savomart/presentation/widgets/product_card_linear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_screen_controller.dart';

class RecentlyViewedProducts extends StatelessWidget {
  const RecentlyViewedProducts({
    Key? key,
    required this.homeScreenController,
  }) : super(key: key);

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryNamewithButton(
          text: AppLocalizations.of(context)!.recently_view,
          onTap: () => Get.toNamed(RouteList.viewAllProductScreen),
          buttonText: AppLocalizations.of(context)!.see_all,
        ),
        defaultSpacerSmall,
        Card(
          child: Column(
            children: [
              ...List.generate(
                  homeScreenController.recentlyViewed.length,
                  (index) => ProductCardLinear(
                      productEntity:
                          homeScreenController.recentlyViewed[index]))
            ],
          ),
        )
      ],
    );
  }
}
