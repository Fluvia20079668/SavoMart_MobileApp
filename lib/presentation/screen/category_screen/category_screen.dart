import 'package:savomart/presentation/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/screen/category_screen/category_screen_controller.dart';
import 'package:savomart/presentation/widgets/category_gridview.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:savomart/utils/debug_utils.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryScreenController categoryScreenController = Get.find();
    categoryScreenController.getData();
    return AnimatedBuilder(
      animation: categoryScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: DefaultAppBar()),
          // drawer: const NavDrawer(),
          body: NetworkResource(
              appError: categoryScreenController.appError,
              loading: categoryScreenController.isLoading,
              retry: () => categoryScreenController.retry(),
              child: CategoryGridView(
                category: categoryScreenController.categoryItems,
                isLoadingMore: categoryScreenController.isLoadingMore,
                moreItemsAvailable: categoryScreenController.moreItemsAvailable,
                scrollController: categoryScreenController.scrollController,
                textEditingController:
                    categoryScreenController.searchController,
                onChange: (value) {
                  categoryScreenController.onChangeSearch(value);
                },
                onClearSearch: () {
                  categoryScreenController.onClearSearch();
                },
                onTap: (value) {
                  consoleLog("onTap.....");
                },
              )),
        );
      },
    );
  }
}
