import 'package:savomart/data/model/selected_address_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/selected_address_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/params/no_params.dart';
import '../../../domain/params/place_order_params.dart';
import '../../../domain/usecases/place_order_usecase.dart';
import 'package:savomart/l10n/app_localizations.dart';
import '../../route/route_constants.dart';
import '../../theme/theme.dart';
import '../../widgets/default_alert_dialog.dart';

class CheckoutScreenController extends ChangeNotifier {
  PaymentOption? paymentOption;
  SelectedAddressUseCase selectedAddressUseCase = Get.find();
  PlaceOrderUseCase placeOrderUseCase = Get.find();
  List deliveryAddress = [];
  final args = Get.arguments;
  AppError? appError;
  bool isLoading = true;
  bool buttonLoading = false;
  Address? address;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getAddress();
  }

  placeOrder(addressId, cartId, type) async {
    makeButtonLoading();
    OrderParams orderParams = OrderParams(
        addressId: addressId.toString(),
        cartid: cartId.toString(),
        paymentType: type.toString());
    final responses = await placeOrderUseCase(orderParams);
    responses.fold((l) => l.handleError(), (r) {
      if (r["status"]) {
        makeButtonNotLoading();
        Get.toNamed(RouteList.orderSuccess);
      } else {
        makeButtonNotLoading();
      }
    });
  }

  getAddress() async {
    appError = null;
    makeLoading();
    NoParams noParams = NoParams();
    final responses = await selectedAddressUseCase(noParams);
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        address = r.address;
        makeNotLoading();
      } else {
        makeNotLoading();
      }
    });
  }

  void changeValue(PaymentOption? value) {
    paymentOption = value!;
    notifyListeners();
  }

  showOrderConfirmAlert(
      BuildContext context, String addressId, cartId, String paymentType) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    defaultPadding * .5)), //this right here
            child: DefaultAlertDialog(
              title: AppLocalizations.of(context)!.are_you_sure,
              description:
                  AppLocalizations.of(context)!.you_want_to_place_order,
              onTapFail: () {
                Get.back();
              },
              onTapSuccess: () {
                Get.back();
                placeOrder(addressId, cartId, paymentType);
              },
              negativeText: AppLocalizations.of(context)!.no,
              positiveText: AppLocalizations.of(context)!.yes,
              bgColorPositive: successColor,
              bgColorNegative: errorColor,
            ),
          );
        });
  }
}

enum PaymentOption { cod, online }
