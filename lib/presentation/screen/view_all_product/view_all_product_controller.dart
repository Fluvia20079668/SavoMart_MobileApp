import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/category_params.dart';
import 'package:savomart/domain/usecases/product_with_category_id.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewAllProductController extends ChangeNotifier {
  ScrollController scrollController =
      ScrollController(debugLabel: "view_all_product_grid_view");

  List productList = [];
  ProductWithCategoryIdUseCase productWithCategoryIdUseCase = Get.find();
  var arg = Get.arguments;

  AppError? appError;
  bool isLoading = true;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getData();
  }

  getData() async {
    appError = null;
    CategoriesParams categoriesParams =
        CategoriesParams(categoriesId: arg.toString());
    final responses = await productWithCategoryIdUseCase(categoriesParams);
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        productList.clear();
        productList.addAll(r.items.products);
      } else {}
    });
    makeNotLoading();
  }

  int offset = 0;
  bool isLoadingMore = false;
  bool moreItemsAvailable = true;
  makeNoMoreItems() {
    moreItemsAvailable = false;
    notifyListeners();
  }

  makeMoreItems() {
    moreItemsAvailable = true;
    notifyListeners();
  }

  makeLoadingMore() {
    isLoadingMore = true;
    notifyListeners();
  }

  makeNotLoadingMore() {
    isLoadingMore = false;
    notifyListeners();
  }

  loadMore() async {
    if (moreItemsAvailable && !isLoadingMore) {
      makeLoadingMore();
      offset++;
      consoleLog('Loading More $offset');
      await Future.delayed(const Duration(seconds: 2));
      makeNotLoadingMore();
    }
  }
}
