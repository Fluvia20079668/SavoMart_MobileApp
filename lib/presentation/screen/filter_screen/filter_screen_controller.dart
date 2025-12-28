import 'package:savomart/domain/entities/filter_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FilterScreenController extends ChangeNotifier {
  FilterScreenArguments filterScreenArguments = Get.arguments;

  late List<FilterEntity> filters = filterScreenArguments.filters;

  resetFilters() {
    for (var items in filters) {
      for (var filterItem in items.filterItems) {
        filterItem.selected = false;
      }
    }
    notifyListeners();
  }

  changeType(FilterTypeEntity type) {
    for (var element in filters) {
      element.filterTypeEntity.selected =
          element.filterTypeEntity == type ? true : false;
    }
    notifyListeners();
  }

  changeSelection(FilterItemEntity item, bool value) {
    filters
        .singleWhere((element) => element.filterTypeEntity.selected)
        .filterItems
        .singleWhere((element) => element == item)
        .selected = value;
    notifyListeners();
  }

  setFilters() {
    filterScreenArguments.applyFilters(filters);
    Get.back();
  }

  clearFilters() {
    resetFilters();
    filterScreenArguments.applyFilters(filters);
    Get.back();
  }
}
