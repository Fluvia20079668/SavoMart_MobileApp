import 'package:savomart/domain/entities/filter_entity.dart';
import 'package:savomart/presentation/screen/filter_screen/filter_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class FilterItemsList extends StatelessWidget {
  const FilterItemsList({
    Key? key,
    required this.filterController,
  }) : super(key: key);

  final FilterScreenController filterController;

  @override
  Widget build(BuildContext context) {
    final FilterEntity selectedFilterType = filterController.filters
        .singleWhere((element) => element.filterTypeEntity.selected);
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(selectedFilterType.filterItems.length, (index) {
            final FilterItemEntity filterItemEntity =
                selectedFilterType.filterItems[index];
            return CheckboxListTile(
              value: filterItemEntity.selected,
              activeColor: primaryColor,
              onChanged: (value) =>
                  filterController.changeSelection(filterItemEntity, value!),
              title: Text(filterItemEntity.itemText),
            );
          })
        ],
      ),
    );
  }
}
