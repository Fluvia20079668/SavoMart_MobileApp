import 'package:savomart/presentation/screen/my_order_details/components/return_order_item.dart';
import 'package:savomart/presentation/screen/my_order_details/my_order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:savomart/l10n/app_localizations.dart';
import '../../../theme/theme.dart';

class ReturnItemBottomSheet extends StatelessWidget {
  const ReturnItemBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyOrderDetailsController myOrderDetailsController = Get.find();
    return AnimatedBuilder(
      animation: myOrderDetailsController,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(defaultPadding * .9),
          width: double.infinity,
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * .3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.return_item,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: defaultPadding * .8),
                      ),
                      const SizedBox(
                        height: defaultPadding * .1,
                      ),
                      Text(
                        AppLocalizations.of(context)!.choose_product_to_return,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: blackColor,
                              fontSize: defaultPadding * .55,
                            ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                    myOrderDetailsController.ordetitem.length,
                    (index) => OrderReturnItem(
                        ordeitem: myOrderDetailsController.ordetitem[index]))
              ],
            ),
          ),
        );
      },
    );
  }
}
