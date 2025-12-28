import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../add_address_controller.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({
    Key? key,
    required this.addAddressController,
  }) : super(key: key);

  final AddAddressController addAddressController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addAddressController.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding * .2),
                child: Text(
                  AppLocalizations.of(context)!.address,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: defaultPadding * .55,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 3,
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.enter_address
                  : value.length < 10
                      ? AppLocalizations.of(context)!
                          .enter_more_specific_address
                      : null;
            },
            controller: addAddressController.addressController,
            // decoration: InputDecoration(
            //   label: Text(AppLocalizations.of(context)!.address),
            // ),
          ),
          defaultSpacer,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding * .2),
                child: Text(
                  AppLocalizations.of(context)!.street,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: defaultPadding * .55,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          TextFormField(
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.enter_street_name
                  : value.length < 3
                      ? AppLocalizations.of(context)!.enter_valid_street_name
                      : null;
            },
            controller: addAddressController.streetController,
            // decoration: InputDecoration(
            //   label: Text(AppLocalizations.of(context)!.street),
            // ),
          ),
          defaultSpacer,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding * .2),
                child: Text(
                  AppLocalizations.of(context)!.phone_number,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: defaultPadding * .55,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          TextFormField(
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_phone
                  : null;
            },
            inputFormatters: [
              // LengthLimitingTextInputFormatter(9),
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: true), // OR keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: addAddressController.phoneController,
            // decoration: const InputDecoration(
            //     // label: Text(AppLocalizations.of(context)!.phone_number),
            //     prefixText: "+966 "),
          ),
        ],
      ),
    );
  }
}
