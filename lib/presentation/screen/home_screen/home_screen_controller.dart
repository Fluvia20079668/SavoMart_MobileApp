import 'package:savomart/domain/params/home_category_product_param.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/change_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/entities/product_entity.dart';
import 'package:get/get.dart';
import '../../../data/model/categories_withproduct_model.dart';
import '../../../domain/usecases/banner_usecase.dart';
import '../../../domain/usecases/categories_product_usecase.dart';
import '../../../domain/usecases/categories_usecase.dart';

class HomeScreenController extends ChangeNotifier {
  List bannerItems = [];
  List categoryItems = [];
  List<Category> homeProducts = [];
  List<ProductEntity> recentlyViewed = [];
  BannerUsecase bannerUsecase = Get.find();
  CategoriesUsecase categoriesUsecase = Get.find();
  CategoriesWithProductUsecase categoriesWithProductUsecase = Get.find();
  NoParams noParams = NoParams();
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

  getBanners() async {
    final response = await bannerUsecase(noParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.status) {
        bannerItems = r.banner;
      }
    });
  }

  getData() async {
    appError = null;
    final response = await bannerUsecase(noParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.status) {
        bannerItems.clear();
        bannerItems.addAll(r.banner);
      } else {}
    });

    final responses = await categoriesUsecase(noParams);
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        categoryItems = [];
        categoryItems.addAll(r.category);
      } else {}
    });

    HomeCategoriesParams categoriesParams =
        const HomeCategoriesParams(categoryLimit: "10", productLimit: "10");
    final responsewithproduct =
        await categoriesWithProductUsecase(categoriesParams);
    responsewithproduct.fold((l) => l.handleError(), (r) {
      if (r.status) {
        homeProducts = [];
        homeProducts.addAll(r.category);
      } else {}
    });
    makeNotLoading();
  }

  void changeLocale() {
    final currentLocale = Get.locale;
    Get.find<ChangeLocale>()(currentLocale == const Locale("en")
        ? const Locale("ar")
        : const Locale("en"));
    Get.back();
  }
}
