import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/filter_screen/filter_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/filter_items_list.dart';
import 'components/filter_type_list.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterScreenController filterScreenController = Get.find();
    return AnimatedBuilder(
      animation: filterScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.filter,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: FilterTypeList(filterController: filterScreenController),
              ),
              const VerticalDivider(),
              Expanded(
                  flex: 3,
                  child: FilterItemsList(
                    filterController: filterScreenController,
                  ))
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: AppBar().preferredSize.height,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DefaultButton(
                      backgroundColor: greyColor,
                      borderRadius: 0,
                      height: double.infinity,
                      text: AppLocalizations.of(context)!.reset,
                      onPressed: filterScreenController.clearFilters,
                      isLoading: false),
                ),
                Expanded(
                  flex: 3,
                  child: DefaultButton(
                      borderRadius: 0,
                      height: double.infinity,
                      text: AppLocalizations.of(context)!.apply,
                      onPressed: filterScreenController.setFilters,
                      isLoading: false),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
