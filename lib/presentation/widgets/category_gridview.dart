import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_search_box.dart';
import 'package:savomart/presentation/widgets/pagination_indicator.dart';

import 'header_with_padding.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key? key,
    required this.category,
    required this.isLoadingMore,
    required this.moreItemsAvailable,
    required this.scrollController,
    required this.textEditingController,
    this.onTap,
    this.onClearSearch,
    this.onChange,
  }) : super(key: key);

  final List category;
  final bool isLoadingMore;
  final bool moreItemsAvailable;
  final ScrollController scrollController;
  final TextEditingController textEditingController;
  final Function(String)? onTap;
  final VoidCallback? onClearSearch;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return category.isEmpty
        ? const Center(child: Text("No Item Found"))
        : CustomScrollView(controller: scrollController, slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * .5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWithPadding(
                      text: AppLocalizations.of(context)!.categories,
                    ),
                    defaultSpacerSmall,
                    DefaultSearchBox(
                      textEditingController: textEditingController,
                      hintText: AppLocalizations.of(context)!.search_category,
                      borderRadius: defaultPadding * .5,
                      onChange: (value) {
                        onChange!(value);
                      },
                      onClearSearch: onClearSearch,
                      onTap: (value) {
                        onTap!(value);
                      },
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CategoryCard(
                    category: category[index],
                  ),
                  childCount: category.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: defaultPadding * .5,
                  crossAxisSpacing: defaultPadding * .7,
                  childAspectRatio: .7,
                ),
              ),
              padding: const EdgeInsets.all(
                defaultPadding * .5,
              ),
            ),
            SliverToBoxAdapter(
              child: PaginationIndicator(
                isLoading: isLoadingMore,
                moreItemsAvailable: moreItemsAvailable,
              ),
            )
          ]);
  }
}
