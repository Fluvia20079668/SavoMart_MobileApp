import 'dart:io';

import 'package:savomart/domain/params/order_return_args.dart';
import 'package:savomart/presentation/screen/my_order_details/my_order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/order_return_usecase.dart';
import '../../../utils/image_picker_service.dart';
import '../../../utils/snackbar_uils.dart';
import '../my_orders_screen/my_order_controller.dart';

class ReturnOrderItemController extends ChangeNotifier {
  final locationController = TextEditingController();
  final returnReasonController = TextEditingController();

  OrderReturnArgs orderReturnArgs = Get.arguments;

  OrderReturnUseCase orderReturnUseCase = Get.find();
  MyOrderDetailsController myOrderDetailsController = Get.find();
  MyorderController myorderController = Get.find();

  List<File> returnImage = [];

  bool buttonLoading = false;

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  uploadImage() async {
    final file = await ImagePickerService.imagePickerType();
    if (file != null) {
      returnImage.add(file);
      notifyListeners();
    }
  }

  removeDocument(int index) {
    returnImage.removeAt(index);
    notifyListeners();
  }

  final returnOrderFormKey =
      GlobalKey<FormState>(debugLabel: 'return_order_form_key');
  bool validate() {
    bool valid = false;
    if (returnOrderFormKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }

  returnOrder() async {
    if (validate()) {
      makeButtonLoading();
      OrderReturnParms orderReturnParms = OrderReturnParms(
          orderItemId: orderReturnArgs.orderItem.orderItemId!,
          productId: orderReturnArgs.orderItem.productId,
          location: locationController.text,
          reason: returnReasonController.text,
          images: returnImage);
      final response = await orderReturnUseCase(orderReturnParms);
      response.fold((l) {
        l.handleError();
      }, (r) {
        if (r["status"]) {
          myOrderDetailsController.getData();
          myorderController.getData();
          Get.back();
        }
        showMessage(r["message"]);
      });
      makeButtonNotLoading();
    }
  }
}
