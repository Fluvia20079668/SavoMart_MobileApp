import 'package:savomart/domain/entities/category_entity.dart';
import 'package:savomart/domain/entities/filter_entity.dart';
import 'package:savomart/presentation/widgets/sort_button.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/entities/product_entity.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/params/category_params.dart';
import '../../../domain/usecases/product_with_category_id.dart';

class CategoryPrductController extends ChangeNotifier {
  ScrollController scrollController =
      ScrollController(debugLabel: "category_product_grid_view");
  SortType selectedSortType = SortType.lowToHigh;

  int selectedIndex = 0;
  List poductList = [];
  String categoryName = '';

  List<ProductEntity> productList = [];
  List<CategoryEntity> categories = [];
  List<FilterEntity> filterList = [];
  ProductWithCategoryIdUseCase productWithCategoryIdUseCase = Get.find();
  bool isGrid = true;
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

  getData([index]) async {
    categories.clear();
    List<CategoryEntity> categoryEntity = [
      CategoryEntity(
          id: arg[0].id,
          name: "All",
          logo: "",
          icon: "sdg",
          status: "dsf",
          isSelected: true)
    ];
    categories.addAll(categoryEntity);
    categories.addAll(arg[0].subCategory);
    CategoriesParams categoriesParams =
        CategoriesParams(categoriesId: categories[index].id);
    final responses = await productWithCategoryIdUseCase(categoriesParams);
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        poductList.clear();
        categoryName = r.items.name;
        poductList.addAll(r.items.products);
      } else {}
    });

    filterList = [
      FilterEntity(
        filterTypeEntity:
            FilterTypeEntity(text: 'Weight', selected: true, id: "1"),
        filterItems: [
          FilterItemEntity(itemText: "1 Kg", id: "7"),
          FilterItemEntity(itemText: "5 Kg", id: "8"),
          FilterItemEntity(itemText: "10 Kg", id: "9"),
        ],
      ),
      FilterEntity(
        filterTypeEntity: FilterTypeEntity(text: 'Quality', id: "2"),
        filterItems: [
          FilterItemEntity(itemText: "Best", id: "1"),
          FilterItemEntity(itemText: "Good", id: "2"),
          FilterItemEntity(itemText: "Average", id: "3"),
        ],
      ),
    ];
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

  toggleView() {
    isGrid = !isGrid;
    notifyListeners();
  }

  void changeCategory(int index, CategoryEntity categoryItem) {
    selectedIndex = index;

    for (var element in categories) {
      if (element.id == categoryItem.id) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }

    getProducts(index);
    notifyListeners();
  }

  getProducts(int index) async {
    CategoriesParams categoriesParams =
        CategoriesParams(categoriesId: categories[index].id);
    final responses = await productWithCategoryIdUseCase(categoriesParams);
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        poductList.clear();
        categoryName = r.items.name;
        poductList.addAll(r.items.products);
      } else {}
    });
    notifyListeners();
  }

  sortProducts(SortType sortType) {
    selectedSortType = sortType;
    offset = 0;
    notifyListeners();
  }
}
