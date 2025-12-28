import 'package:savomart/data/model/oder_details_model.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/entities/oder_entity.dart';
import 'package:savomart/domain/params/order_details_params.dart';
import 'package:savomart/domain/usecases/cancel_order_usecase.dart';
import 'package:savomart/domain/usecases/order_details_usecase.dart';
import 'package:savomart/utils/snackbar_uils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/params/cancel_order_params.dart';
import '../../../domain/params/order_return_args.dart';
import 'package:savomart/l10n/app_localizations.dart';
import '../../route/route_constants.dart';
import '../../theme/theme.dart';
import '../../widgets/default_alert_dialog.dart';
import '../my_orders_screen/my_order_controller.dart';
import 'components/return_item_bottom_sheet.dart';

class MyOrderDetailsController extends ChangeNotifier {
  AppError? appError;
  bool isLoading = true;
  bool buttonLoading = false;
  OrderDetailsUsecase orderDetailsUsecase = Get.find();
  CancelOrderUseCase cancelOrderUseCase = Get.find();
  List<OrderEntity> ordetitem = [];
  MyorderController myorderController = Get.find();
  Order? order;
  var arg = Get.arguments;

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

  makeButtonStopLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getData();
  }

  getData() async {
    OrderDetailsParams orderDetailsParams =
        OrderDetailsParams(orderId: arg.toString());
    final response = await orderDetailsUsecase(orderDetailsParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.status) {
        ordetitem = r.order!.orderItems;
        order = r.order;
        makeNotLoading();
      } else {
        makeNotLoading();
      }
    });
  }

  showCancelOrderConfirmAlert(BuildContext context, String orderId) {
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
                  AppLocalizations.of(context)!.you_want_to_cancel_order,
              onTapFail: () {
                Get.back();
              },
              onTapSuccess: () {
                Get.back();
                cancelOrder(orderId);
              },
              negativeText: AppLocalizations.of(context)!.no,
              positiveText: AppLocalizations.of(context)!.yes,
              bgColorPositive: primaryColor,
              bgColorNegative: errorColor,
            ),
          );
        });
  }

  cancelOrder(orderId) async {
    makeButtonLoading();
    CancelOrderParam cancelOrderParam =
        CancelOrderParam(id: orderId.toString());
    final response = await cancelOrderUseCase(cancelOrderParam);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"]) {
        myorderController.getData();
        Get.back();
        makeButtonStopLoading();
      } else {
        makeButtonStopLoading();
      }
    });
  }

  returnOrderItem(BuildContext context) {
    if (ordetitem.length == 1) {
      if (ordetitem[0].returnStatus == "pending") {
        Get.toNamed(RouteList.returnOrderItem,
            arguments: OrderReturnArgs(
                orderId: arg.toString(), orderItem: ordetitem[0]));
      } else {
        showMessage(AppLocalizations.of(context)!.already_returned);
      }
    } else {
      showModalBottomSheet(
          constraints: const BoxConstraints(maxWidth: double.infinity),
          backgroundColor: whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultPadding),
                topRight: Radius.circular(defaultPadding)),
          ),
          context: context,
          builder: (context) {
            return const ReturnItemBottomSheet();
          });
    }
  }
}
