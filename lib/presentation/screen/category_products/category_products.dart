import 'package:flutter_svg/svg.dart';
import 'package:savomart/presentation/screen/category_products/components/subcategory_item.dart';
import 'package:savomart/presentation/widgets/product_linear_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/screen/category_products/category_product_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:savomart/presentation/widgets/product_gridview.dart';

import 'package:savomart/l10n/app_localizations.dart';
import '../../route/route_constants.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryPrductController categoryPrductController = Get.find();

    categoryPrductController.getData(0);

    return AnimatedBuilder(
      animation: categoryPrductController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            titleSpacing: 0,
            title: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * .5,
                    vertical: defaultPadding * .3),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          categoryPrductController.categories.length,
                          (index) => SubCategoryItem(
                                category:
                                    categoryPrductController.categories[index],
                                categoryPrductController:
                                    categoryPrductController,
                                index: index,
                              ))
                    ],
                  ),
                )),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight * 1.3),
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * .5),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: SvgPicture.asset("assets/svgs/arrow_left.svg")),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteList.searchScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding * .45,
                              vertical: defaultPadding * .3),
                          decoration: BoxDecoration(
                              color: scaffoldBg,
                              borderRadius:
                                  BorderRadius.circular(defaultPadding * 2)),
                          child: Row(
                            children: [
                              defaultSpacerHorizontalSmall,
                              SvgPicture.asset("assets/svgs/search.svg"),
                              defaultSpacerHorizontalSmall,
                              Expanded(
                                  child: DefaultText(
                                title: AppLocalizations.of(context)!.search,
                                fontSize: defaultPadding * .7,
                              )),
                              defaultSpacerHorizontalSmall,
                              DefaultIconButton(
                                  onTap: () {},
                                  iconUrl: "assets/svgs/search_arrow.svg")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: NetworkResource(
              appError: categoryPrductController.appError,
              loading: categoryPrductController.isLoading,
              retry: () => categoryPrductController.retry(),
              child: categoryPrductController.isGrid
                  ? ProductGridView(
                      product: categoryPrductController.poductList,
                      isLoadingMore: categoryPrductController.isLoadingMore,
                      moreItemsAvailable:
                          categoryPrductController.moreItemsAvailable,
                      scrollController:
                          categoryPrductController.scrollController)
                  : ProductLinearView(
                      product: categoryPrductController.poductList,
                      isLoadingMore: categoryPrductController.isLoadingMore,
                      moreItemsAvailable:
                          categoryPrductController.moreItemsAvailable,
                      scrollController:
                          categoryPrductController.scrollController)),
        );
      },
    );
  }
}
