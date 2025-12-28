import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_item_with_flex.dart';
import 'package:savomart/utils/formaters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({
    this.order,
    Key? key,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final order;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(defaultPadding * .5),
      onTap: () => Get.toNamed(RouteList.myOrderDetails, arguments: order.id),
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsetsDirectional.only(bottom: defaultPadding * .5),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultPadding * .5)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      top: defaultPadding),
                  child: Column(
                    children: [
                      DefaultItemwithFlex(
                        keyText: AppLocalizations.of(context)!.order_id,
                        valueText: order.orderNo,
                        keyTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                        valueTextStyle: Theme.of(context).textTheme.bodySmall!,
                      ),
                      defaultSpacerSmall,
                      DefaultItemwithFlex(
                        keyText:
                            AppLocalizations.of(context)!.delivery_location,
                        valueText: order.location,
                        keyTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                        valueTextStyle: Theme.of(context).textTheme.bodySmall!,
                      ),
                      defaultSpacerSmall,
                      DefaultItemwithFlex(
                        keyText: AppLocalizations.of(context)!.order_status,
                        valueText: order.status.toString().toCapitalize(),
                        keyTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                        valueTextStyle: Theme.of(context).textTheme.bodySmall!,
                      ),
                      defaultSpacerSmall,
                      DefaultItemwithFlex(
                        keyText: AppLocalizations.of(context)!.payment_option,
                        valueText: order.paymentType == 0
                            ? "Cash on Delivery"
                            : "Online Payment",
                        keyTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                        valueTextStyle: Theme.of(context).textTheme.bodySmall!,
                      ),
                      defaultSpacerSmall,
                      DefaultItemwithFlex(
                        keyText: AppLocalizations.of(context)!.order_date,
                        valueText: DateFormat("dd-MM-yyyy").format(order.date),
                        keyTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                        valueTextStyle: Theme.of(context).textTheme.bodySmall!,
                      ),
                      if (order.status == "delivered") defaultSpacerSmall,
                      if (order.status == "delivered")
                        DefaultItemwithFlex(
                          keyText: AppLocalizations.of(context)!.delivery_date,
                          valueText: DateFormat("dd-MM-yyyy")
                              .format(order.deliveryDate!),
                          keyTextStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                          valueTextStyle:
                              Theme.of(context).textTheme.bodySmall!,
                        ),
                      defaultSpacerSmall,
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [whiteColor, primaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(defaultPadding * .5),
                          bottomRight: Radius.circular(defaultPadding * .5))),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${order.totalItems} ${AppLocalizations.of(context)!.items} - SR ${order.grandTotal}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1White()
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
