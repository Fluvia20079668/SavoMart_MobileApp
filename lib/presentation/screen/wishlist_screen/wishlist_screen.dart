import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/wishlist_screen/wishlist_screen_controller.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:savomart/presentation/widgets/product_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistScreenController wishlistScreenController = Get.find();
    wishlistScreenController.getData();
    return AnimatedBuilder(
      animation: wishlistScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.wishlist,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: NetworkResource(
            appError: wishlistScreenController.appError,
            loading: wishlistScreenController.isLoading,
            retry: () => wishlistScreenController.retry(),
            child: ProductGridView(
              product: wishlistScreenController.productList,
              isLoadingMore: wishlistScreenController.isLoadingMore,
              moreItemsAvailable: wishlistScreenController.moreItemsAvailable,
              scrollController: wishlistScreenController.scrollController,
              isWishlist: true,
            ),
          ),
        );
      },
    );
  }
}
