import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/params/select_address_params.dart';
import 'package:savomart/domain/usecases/address_list_usecase.dart';
import 'package:savomart/domain/usecases/delete_addrees_usecase.dart';
import 'package:savomart/domain/usecases/select_address_usecase.dart';
import 'package:savomart/presentation/screen/checkout_screen/checkout_screen_controller.dart';
import 'package:savomart/utils/snackbar_uils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyAddressController extends ChangeNotifier {
  AppError? appError;
  bool isLoading = true;
  List? addressList = [];

  AddressListUseCase addressListUseCase = Get.find();
  SelectAddressUseCase selectAddressUseCase = Get.find();
  CheckoutScreenController checkoutScreenController = Get.find();
  DeleteAddressUsecase deleteAddressUsecase = Get.find();

  var arg = Get.arguments;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getData();
  }

  selectAddress(id) async {
    SelectAddressParam selectAddressParam =
        SelectAddressParam(addressId: id.toString());
    final responses = await selectAddressUseCase(selectAddressParam);
    responses.fold((l) => l.handleError(), (r) {
      if (arg == "changeAddress") {
        checkoutScreenController.getAddress();
        Get.back();
      }
      showMessage(r["message"]);
    });
  }

  getData() async {
    appError = null;
    final responses = await addressListUseCase(NoParams());
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        addressList = r.address;
      }
    });
    makeNotLoading();
  }

  deleteAddress(id) async {
    DeleteParam deleteParam = DeleteParam(addressId: id.toString());
    final response = await deleteAddressUsecase(deleteParam);
    response.fold((l) {
      l.handleError();
    }, (r) {
      if (r["status"]) {
        showMessage(r["message"]);
        getData();
      }
    });
    notifyListeners();
  }
}
