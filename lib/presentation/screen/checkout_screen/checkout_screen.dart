import 'package:savomart/domain/params/address_params.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/checkout_screen/checkout_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:savomart/utils/snackbar_uils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/header_with_padding.dart';
import 'components/bill_details_checkout.dart';
import 'components/delivery_address.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CheckoutScreenController checkoutScreenController = Get.find();
    checkoutScreenController.getAddress();
    return AnimatedBuilder(
      animation: checkoutScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.checkout,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: NetworkResource(
            loading: checkoutScreenController.isLoading,
            appError: checkoutScreenController.appError,
            retry: () => checkoutScreenController.retry(),
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding * .5),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderWithPadding(
                            text:
                                AppLocalizations.of(context)!.delivery_address,
                          ),
                          defaultSpacerSmall,
                          if (checkoutScreenController.address != null &&
                              checkoutScreenController.address!.id != "null")
                            DeliveryAddress(
                                street:
                                    checkoutScreenController.address!.street,
                                phone: checkoutScreenController.address!.number,
                                address: checkoutScreenController
                                    .address!.addressLine1),
                          defaultSpacerSmall,

                          DefaultButton(
                              text:
                                  AppLocalizations.of(context)!.add_new_address,
                              height: defaultPadding * 2.5,
                              elevation: 0,
                              backgroundColor: whiteColor,
                              imageUrl: "assets/svgs/ic_add.svg",
                              isIcon: true,
                              textColor: blackColor,
                              textSize: defaultPadding * .6,
                              isBold: false,
                              onPressed: () {
                                Get.toNamed(RouteList.addAddressScreen,
                                    arguments: const ChangeAddressParam(
                                        from: "addnew"));
                              },
                              isLoading: false),

                          // const ApplyCoupon(),
                          // PaymentOptionCheckout(
                          //     checkoutScreenController: checkoutScreenController),

                          defaultSpacer,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Column(
                      children: [
                        BillDetailsCheckout(
                            itemcount: checkoutScreenController.args[1],
                            totalamount: checkoutScreenController.args[2]),
                        defaultSpacer,
                        DefaultButton(
                            text: AppLocalizations.of(context)!.place_order,
                            backgroundColor: primaryColorDark,
                            isBold: true,
                            onPressed: () {
                              if (checkoutScreenController.address != null) {
                                checkoutScreenController.showOrderConfirmAlert(
                                    context,
                                    checkoutScreenController.address!.id,
                                    checkoutScreenController.args[0],
                                    "0");
                              } else {
                                showMessage("Select a delivery address");
                              }
                            },
                            isLoading: checkoutScreenController.buttonLoading),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
