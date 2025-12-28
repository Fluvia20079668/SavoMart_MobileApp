// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:savomart/presentation/core/navigation_screen/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/cart_list_usecase.dart';

class NavigationScreenController extends ChangeNotifier {
  Screens currentScreen = Screens.home;
  CartListUsecase cartListUsecase = Get.find();
  int cartCount=0;

  var ctime;

  changeScreen(int index) {
    currentScreen = Screens.values[index];
    getData();
    notifyListeners();
  }

  getData() async {
    final responses = await cartListUsecase(NoParams());
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        cartCount=r.cart.cartItems.length;
      }
    });
    notifyListeners();
  }

  // changelocale() async {
  //   final user = Get.find<AuthController>().user;
  //   if (user != null) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     Get.find<ChangeLocale>()(Locale(user.locale));
  //   }
  // }
}
