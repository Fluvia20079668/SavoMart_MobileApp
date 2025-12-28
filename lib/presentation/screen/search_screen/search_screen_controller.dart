import 'package:savomart/domain/usecases/product_search_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/entities/product_entity.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:get/get.dart';

class SearchScreenController extends ChangeNotifier {
  ScrollController scrollController =
      ScrollController(debugLabel: "search_grid_view");

  List<ProductEntity> productList = [];
  final searchController = TextEditingController();

  ProductSearchUsecase productSearchUsecase = Get.find();

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
    await Future.delayed(const Duration(seconds: 2));
    appError = null;
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

  submitSearch(String val) async {
    if (val.length > 3) {
      getSearchResult();
    } else if (val.isEmpty) {
      getSearchResult();
    }
  }

  clearSearch() {
    searchController.clear();
    getSearchResult();
    notifyListeners();
  }

  getSearchResult() async {
    ProductSearchParams productSearchParams =
        ProductSearchParams(searchKey: searchController.text);
    final response = await productSearchUsecase(productSearchParams);
    response.fold((l) {
      l.handleError();
    }, (r) {
      productList = r.data.products;
    });
    notifyListeners();
  }
}
