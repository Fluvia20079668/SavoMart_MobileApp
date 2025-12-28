import 'dart:async';

import 'package:savomart/domain/entities/app_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyController extends ChangeNotifier {
  StreamController<ErrorAnimationType>? errorController;

  TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  String currentText = "";
  bool isTimerStart = true;

  AppError? appError;
  bool buttonLoading = false;

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  void getData() {
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  void onchangePin(String value) {
    currentText = value;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();
  bool validate() {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }

  void otpVerify() async {
    makeButtonLoading();
    if (validate()) {
      hasError = false;
      await Future.delayed(const Duration(seconds: 2));
    } else {
      hasError = true;
    }
    makeButtonNotLoading();
  }

  startTimer() {
    isTimerStart = true;
    notifyListeners();
  }

  stopTimer() {
    isTimerStart = false;
    notifyListeners();
  }
}
