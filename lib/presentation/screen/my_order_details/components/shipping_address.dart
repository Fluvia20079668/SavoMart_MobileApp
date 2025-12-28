import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/checkout_screen/components/delivery_address.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_key_value.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({
    this.location,
    Key? key,
  }) : super(key: key);
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultPadding*.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithButton(
              title: AppLocalizations.of(context)!.shipping_address, buttonText: "", onTap: () {}),
          defaultSpacerSmall,
           DefaultKeyValue(
            keyText:
                location??"",
            valueText: "",
          ),
        ],
      ),
    );
  }
}
