import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/product_details/components/related_item.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/screen/home_screen/home_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/category_name_with_button.dart';
import 'package:get/get.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({
    Key? key,
    required this.homeScreenController,
  }) : super(key: key);

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(homeScreenController.homeProducts.length, (index) {
          if (homeScreenController.homeProducts[index].products.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryNamewithButton(
                  text: homeScreenController.homeProducts[index].name,
                  onTap: () => Get.toNamed(RouteList.viewAllProductScreen,
                      arguments: homeScreenController.homeProducts[index].id),
                  buttonText: AppLocalizations.of(context)!.see_all,
                ),
                defaultSpacerSmall,
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          homeScreenController
                              .homeProducts[index].products.length,
                          (productIndex) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  right: defaultPadding * .5),
                              child: RelatedItem(
                                productEntity: homeScreenController
                                    .homeProducts[index].products[productIndex],
                                isRelated: false,
                              ),
                            );
                          },
                        ),
                      ],
                    )),
                defaultSpacer
              ],
            );
          } else {
            return const SizedBox(
              height: 0,
              width: 0,
            );
          }
        })
      ],
    );
  }
}
