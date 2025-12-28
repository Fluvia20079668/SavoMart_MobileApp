import 'package:savomart/domain/entities/filter_entity.dart';
import 'package:savomart/presentation/screen/filter_screen/filter_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class FilterTypeList extends StatelessWidget {
  const FilterTypeList({
    Key? key,
    required this.filterController,
  }) : super(key: key);

  final FilterScreenController filterController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(filterController.filters.length, (index) {
            final FilterTypeEntity filterTypeEntity =
                filterController.filters[index].filterTypeEntity;
            return ListTile(
              onTap: () => filterController.changeType(filterTypeEntity),
              selected: filterTypeEntity.selected,
              title: Text(
                filterTypeEntity.text,
                style: TextStyle(
                    color:
                        filterTypeEntity.selected ? primaryColor : blackColor),
              ),
            );
          })
        ],
      ),
    );
  }
}
