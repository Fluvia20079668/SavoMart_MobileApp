import 'package:savomart/presentation/screen/product_details/components/related_item.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/pagination_indicator.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView(
      {Key? key,
      required this.product,
      required this.isLoadingMore,
      required this.moreItemsAvailable,
      required this.scrollController})
      : super(key: key);

  final List product;
  final bool isLoadingMore;
  final bool moreItemsAvailable;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: scrollController, slivers: [
      SliverPadding(
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => RelatedItem(
              productEntity: product[index],
              isRelated: false,
            ),
            childCount: product.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: defaultPadding * .3,
            crossAxisSpacing: defaultPadding * .3,
            childAspectRatio: .8,
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
