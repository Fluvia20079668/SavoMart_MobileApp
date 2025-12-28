import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/wish_list_usecase.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/params/wishlist_params.dart';
import '../../../domain/usecases/add_to_wishlist_usecase.dart';
import '../../../utils/snackbar_uils.dart';

class WishlistScreenController extends ChangeNotifier {
  ScrollController scrollController =
      ScrollController(debugLabel: "wishlist_grid_view");
  WishListUseCase wishListUseCase = Get.find();
  AddToWishListUseCase addToWishListUseCase = Get.find();
  List productList = [];

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
    final response = await wishListUseCase(NoParams());
    response.fold((l) => l.handleError(), (r) {
      if (r.status) {
        productList = r.data;
        makeNotLoading();
      } else {
        makeNotLoading();
      }
    });
    // makeNotLoading();
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

  removFromWhishList(productid, action) async {
    WhishListParam whishListParam =
        WhishListParam(productId: productid.toString(), action: action);
    final response = await addToWishListUseCase(whishListParam);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"]) {
        showMessage(r['message']);
        getData();
      }
    });
    makeNotLoading();
  }
}
