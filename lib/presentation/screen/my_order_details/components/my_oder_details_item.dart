import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_item_with_flex.dart';
import 'package:savomart/utils/formaters.dart';
import 'package:flutter/material.dart';

class MyOderDetailsItem extends StatelessWidget {
  const MyOderDetailsItem({
    this.oderId,
    this.orderStatus,
    this.date,
    this.deliveryDate,
    Key? key,
  }) : super(key: key);
  final String? oderId;
  final String? orderStatus;
  final String? date;
  final String? deliveryDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultPadding*.5)
      ),
      child: Column(
        children: [
          DefaultItemwithFlex(
            keyText: AppLocalizations.of(context)!.order_id,
            valueText: oderId ?? "",
            keyTextStyle: Theme.of(context).textTheme.bodyMedium!,
            valueTextStyle: Theme.of(context).textTheme.bodyMedium!,
          ),
          defaultSpacerSmall,
          DefaultItemwithFlex(
            keyText: AppLocalizations.of(context)!.order_status,
            valueText: orderStatus != null ? orderStatus!.toCapitalize() : "",
            keyTextStyle: Theme.of(context).textTheme.bodyMedium!,
            valueTextStyle: Theme.of(context).textTheme.bodyMedium!,
          ),
          defaultSpacerSmall,
          DefaultItemwithFlex(
            keyText: AppLocalizations.of(context)!.order_date,
            valueText: date ?? "",
            keyTextStyle: Theme.of(context).textTheme.bodyMedium!,
            valueTextStyle: Theme.of(context).textTheme.bodyMedium!,
          ),
          if (deliveryDate != null) defaultSpacerSmall,
          if (deliveryDate != null)
            DefaultItemwithFlex(
              keyText: AppLocalizations.of(context)!.delivery_date,
              valueText: deliveryDate ?? "",
              keyTextStyle: Theme.of(context).textTheme.bodyMedium!,
              valueTextStyle: Theme.of(context).textTheme.bodyMedium!,
            )
        ],
      ),
    );
  }
}
