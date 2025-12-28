import 'package:savomart/presentation/screen/view_all_product/view_all_product_controller.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:savomart/presentation/widgets/product_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllProductScreen extends StatelessWidget {
  const ViewAllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewAllProductController viewAllProductController = Get.find();
    viewAllProductController.getData();
    return AnimatedBuilder(
      animation: viewAllProductController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Latest Products",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: NetworkResource(
            appError: viewAllProductController.appError,
            loading: viewAllProductController.isLoading,
            retry: () => viewAllProductController.retry(),
            child: ProductGridView(
                product: viewAllProductController.productList,
                isLoadingMore: viewAllProductController.isLoadingMore,
                moreItemsAvailable: viewAllProductController.moreItemsAvailable,
                scrollController: viewAllProductController.scrollController),
          ),
        );
      },
    );
  }
}
