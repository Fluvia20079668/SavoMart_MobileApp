import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import '../checkout_screen_controller.dart';
import 'delivery_address.dart';

class PaymentOptionCheckout extends StatelessWidget {
  const PaymentOptionCheckout({
    Key? key,
    required this.checkoutScreenController,
  }) : super(key: key);

  final CheckoutScreenController checkoutScreenController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWithButton(
                title: AppLocalizations.of(context)!.payment_option,
                buttonText: "",
                onTap: () {}),
            RadioListTile<PaymentOption>(
              activeColor: primaryColor,
              title: Text(AppLocalizations.of(context)!.cash_on_delivery),
              value: PaymentOption.cod,
              dense: true,
              groupValue: PaymentOption.cod,
              onChanged: (PaymentOption? value) {
                checkoutScreenController.changeValue(value);
              },
            ),
            // RadioListTile<PaymentOption>(
            //   activeColor: primaryColor,
            //   title: Text(AppLocalizations.of(context)!.online_payment),
            //   value: PaymentOption.online,
            //   dense: true,
            //   groupValue: checkoutScreenController.paymentOption,
            //   onChanged: (PaymentOption? value) {
            //     checkoutScreenController.changeValue(value);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
