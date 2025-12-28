import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/add_address/add_address_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/add_address_form.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController addAddressController = Get.find();
    addAddressController.setData();
    // addAddressController.changeLocation(context);
    return AnimatedBuilder(
      animation: addAddressController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              addAddressController.changeAddressArgs != null &&
                      addAddressController.changeAddressArgs?.from == "addnew"
                  ? AppLocalizations.of(context)!.address_add
                  : AppLocalizations.of(context)!.edit_address,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(children: [
                // GoogleMapWithChangeLocation(
                //     location: addAddressController.geoLocation,
                //     changeLocation: () =>
                //         addAddressController.changeLocation(context)),
                defaultSpacer,
                AddAddressForm(addAddressController: addAddressController),
              ]),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: scaffoldBg,
            ),
            child: DefaultButton(
              text: AppLocalizations.of(context)!.address_add,
              onPressed: addAddressController.addUserAddress,
              isLoading: addAddressController.buttonLoading,
            ),
          ),
        );
      },
    );
  }
}
