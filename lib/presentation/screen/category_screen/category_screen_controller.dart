import 'package:savomart/domain/params/no_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/categories_usecase.dart';

class CategoryScreenController extends ChangeNotifier {
  ScrollController scrollController =
      ScrollController(debugLabel: "category_grid_view");
  CategoriesUsecase categoriesUsecase = Get.find();
  final searchController = TextEditingController();

  List categoryItems = [];

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
    final responses = await categoriesUsecase(NoParams());
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        categoryItems = [];
        categoryItems.addAll(r.category);
        // showMessage(r['message']);
        // Get.offAllNamed(RouteList.navigation_screen);
        // makeButtonNotLoading();
      } else {
        // showMessage(r["message"]);
        // Get.back();
        // makeButtonNotLoading();
      }
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

  onClearSearch() {
    searchController.clear();
    notifyListeners();
  }

  void onChangeSearch(String value) {
    consoleLog("SearchKey...... : $value");
    notifyListeners();
  }
}
