import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/usecases/order_list_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/params/no_params.dart';

class MyorderController extends ChangeNotifier {
  OrderListUseCase orderListUseCase = Get.find();
  AppError? appError;
  bool isLoading = true;
  List orderList = [];
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

  getData() async {
    appError = null;
    final response = await orderListUseCase(NoParams());
    response.fold((l) => l.handleError(), (r) {
      if (r.status) {
        orderList.clear();
        orderList.addAll(r.order);
        makeNotLoading();
      } else {
        makeNotLoading();
      }
    });
    makeNotLoading();
  }
}
