import 'package:savomart/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/pagination_indicator.dart';
import 'package:savomart/presentation/widgets/product_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView(
      {Key? key,
      required this.product,
      required this.isLoadingMore,
      required this.moreItemsAvailable,
      required this.scrollController,
      this.isWishlist = false,
      this.onTap})
      : super(key: key);

  final List product;
  final bool isLoadingMore;
  final bool moreItemsAvailable;
  final ScrollController scrollController;
  final bool isWishlist;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return product.isEmpty
        ? Center(
            child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Center(
                child: Image.asset(
                  isWishlist
                      ? "assets/gif/wishlist_empty.gif"
                      : "assets/gif/empty_search.gif",
                  width: defaultPadding * 10,
                  fit: BoxFit.cover,
                ),
              ),
              defaultSpacer,
              Text(
                AppLocalizations.of(context)!.no_item_found,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: blackColor.withOpacity(.7),
                    fontSize: defaultPadding * .8),
              ),
            ],
          ))
        : CustomScrollView(controller: scrollController, slivers: [
            SliverPadding(
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCard(
                    productEntity: product[index],
                    isWishlist: isWishlist,
                  ),
                  childCount: product.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding * .4,
                  crossAxisSpacing: defaultPadding * .4,
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
