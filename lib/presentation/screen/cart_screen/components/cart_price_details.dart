import 'package:savomart/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_key_value.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

class CartPriceDetails extends StatelessWidget {
  const CartPriceDetails({
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
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultPadding * 1.5),
              topRight: Radius.circular(defaultPadding * 1.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            title: AppLocalizations.of(context)!.price_details,
            fontSize: defaultPadding * .8,
            isBold: true,
          ),
          defaultSpacer,
          DefaultKeyValue(
            keyText:
                "${AppLocalizations.of(context)!.price} ($itemcount ${AppLocalizations.of(context)!.items})",
            valueText: "${AppLocalizations.of(context)!.price_symbol} $totalamount",
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
          defaultSpacerSmall,
          DefaultKeyValue(
            keyText: AppLocalizations.of(context)!.total_amount,
            valueText: "${AppLocalizations.of(context)!.price_symbol} $totalamount",
            keyWeight: FontWeight.bold,
            valueWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
