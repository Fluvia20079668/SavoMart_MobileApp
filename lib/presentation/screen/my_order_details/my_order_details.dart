import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/my_order_details/my_order_details_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:savomart/utils/formaters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'components/item_list.dart';
import 'components/my_oder_details_item.dart';
import 'components/price_details_order_details.dart';
import 'components/shipping_address.dart';

class MyOrderDetails extends StatelessWidget {
  const MyOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyOrderDetailsController myOrderDetailsController = Get.find();
    myOrderDetailsController.getData();
    return AnimatedBuilder(
      animation: myOrderDetailsController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              AppLocalizations.of(context)!.order_details,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: NetworkResource(
            appError: myOrderDetailsController.appError,
            loading: myOrderDetailsController.isLoading,
            retry: () => myOrderDetailsController.retry(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * .5),
                child: Column(
                  children: [
                    if (myOrderDetailsController.order != null)
                      MyOderDetailsItem(
                        oderId: myOrderDetailsController.order!.orderNo,
                        date: DateFormat("dd-MM-yyyy")
                            .format(myOrderDetailsController.order!.date),
                        orderStatus: myOrderDetailsController.order!.status,
                        deliveryDate: myOrderDetailsController
                                    .order!.deliveryDate !=
                                null
                            ? DateFormat("dd-MM-yyyy").format(
                                myOrderDetailsController.order!.deliveryDate!)
                            : null,
                      ),
                    defaultSpacerSmall,
                    if (myOrderDetailsController.ordetitem.isNotEmpty)
                      ItemList(ordeitem: myOrderDetailsController.ordetitem),
                    defaultSpacerSmall,
                    if (myOrderDetailsController.order != null)
                      ShippingAddress(
                          location: myOrderDetailsController.order!.location),
                    defaultSpacerSmall,
                    if (myOrderDetailsController.order != null)
                      PriceDetailsOrderDetails(
                        amount: myOrderDetailsController.order!.grandTotal,
                        quantity: myOrderDetailsController.ordetitem.length
                            .toString(),
                      ),
                    if (myOrderDetailsController.order != null &&
                        myOrderDetailsController.order!.status == "pending" &&
                        daysBetween(myOrderDetailsController.order!.date,
                                DateTime.now()) ==
                            0)
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding * .5),
                        child: DefaultButton(
                            text: AppLocalizations.of(context)!.cancel_order,
                            elevation: 0,
                            onPressed: () {
                              myOrderDetailsController
                                  .showCancelOrderConfirmAlert(
                                      context,
                                      myOrderDetailsController.order!.id
                                          .toString());
                            },
                            isLoading: myOrderDetailsController.buttonLoading),
                      ),
                    if (myOrderDetailsController.order != null &&
                        myOrderDetailsController.order!.status == "delivered" &&
                        daysBetween(
                                myOrderDetailsController.order!.deliveryDate!,
                                DateTime.now()) ==
                            0)
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding * .5),
                        child: DefaultButton(
                          elevation: 0,
                            text: AppLocalizations.of(context)!.return_order,
                            onPressed: () {
                              myOrderDetailsController.returnOrderItem(context);
                            },
                            isLoading: myOrderDetailsController.buttonLoading),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
