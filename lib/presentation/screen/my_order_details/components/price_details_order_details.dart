import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/checkout_screen/components/delivery_address.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_key_value.dart';
import 'package:flutter/material.dart';

class PriceDetailsOrderDetails extends StatelessWidget {
  const PriceDetailsOrderDetails({
    this.quantity,
    this.amount,
    this.type,
    Key? key,
  }) : super(key: key);
  final String? quantity;
  final String? amount;
  final String? type;

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
                "${AppLocalizations.of(context)!.price} ($quantity ${AppLocalizations.of(context)!.items})",
            valueText: "SR $amount",
          ),
          defaultSpacerSmall,
          DefaultKeyValue(
            keyText: AppLocalizations.of(context)!.discount,
            valueText: "-SR 00.00",
            valueColor: primaryColor,
          ),
          defaultSpacerSmall,
          DefaultKeyValue(
            keyText: AppLocalizations.of(context)!.delivery_charge,
            valueText: "SR 00.00",
          ),
          defaultSpacerSmall,
          DefaultKeyValue(
            keyText: AppLocalizations.of(context)!.total_amount,
            valueText: "SR $amount",
            keyWeight: FontWeight.bold,
            valueWeight: FontWeight.bold,
          ),
          defaultSpacerSmall,
          DefaultKeyValue(
            keyText: AppLocalizations.of(context)!.cash_on_delivery,
            valueText: "",
            keyWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
