import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_key_value.dart';
import 'package:flutter/material.dart';

import 'delivery_address.dart';

class BillDetailsCheckout extends StatelessWidget {
  const BillDetailsCheckout({
    this.itemcount,
    this.totalamount,
    Key? key,
  }) : super(key: key);
  final String? itemcount;
  final String? totalamount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultPadding * .5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithButton(
              title: AppLocalizations.of(context)!.price_details,
              buttonText: "",
              onTap: () {}),
          defaultSpacer,
          DefaultKeyValue(
            keyText:
                "${AppLocalizations.of(context)!.price} ($itemcount ${AppLocalizations.of(context)!.items})",
            valueText:
                "${AppLocalizations.of(context)!.price_symbol} $totalamount",
          ),
          defaultSpacerSmall,
          DefaultKeyValue(
            keyText: AppLocalizations.of(context)!.discount,
            valueText: "-${AppLocalizations.of(context)!.price_symbol} 00.00",
            valueColor: primaryColorLight,
          ),
          defaultSpacerSmall,
          // DefaultKeyValue(
          //   keyText: AppLocalizations.of(context)!.delivery_charge,
          //   valueText: "₹ 20.00",
          // ),
          // defaultSpacerSmall,
          DefaultKeyValue(
            keyText: AppLocalizations.of(context)!.total_amount,
            valueText:
                "${AppLocalizations.of(context)!.price_symbol} $totalamount",
            keyWeight: FontWeight.bold,
            valueWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
