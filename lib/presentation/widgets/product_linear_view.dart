import 'package:savomart/presentation/widgets/product_card_linear.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/pagination_indicator.dart';

class ProductLinearView extends StatelessWidget {
  const ProductLinearView({
    Key? key,
    required this.product,
    required this.isLoadingMore,
    required this.moreItemsAvailable,
    required this.scrollController,
    this.isWishlist = false,
  }) : super(key: key);

  final List product;
  final bool isLoadingMore;
  final bool moreItemsAvailable;
  final ScrollController scrollController;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    return product.isEmpty
        ? const Center(child: Text("No Item Found"))
        : CustomScrollView(controller: scrollController, slivers: [
            SliverPadding(
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCardLinear(
                    productEntity: product[index],
                  ),
                  childCount: product.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: defaultPadding * .2,
                  childAspectRatio: 3.5,
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
