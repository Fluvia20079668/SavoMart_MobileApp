import 'dart:async';

import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/generate_otp_args.dart';
import 'package:savomart/domain/usecases/forgot_password_usecase.dart';
import 'package:savomart/domain/usecases/verify_otp_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../domain/usecases/generate_otp_usecase.dart';
import '../../../utils/snackbar_uils.dart';
import '../../route/route_constants.dart';

class ResetPasswordController extends ChangeNotifier {
  StreamController<ErrorAnimationType>? errorController;

  TextEditingController textEditingController = TextEditingController();

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  VerifyOTPUsecase verifyOTPUsecase = Get.find();
  ForgotPasswordUsecase forgotPasswordUsecase = Get.find();
  GenerateOTpUsecase generateOTpUsecase = Get.find();
  GenerateOTPArgs generateOTPArgs = Get.arguments;

  bool hasError = false;
  String currentText = "";
  bool isTimerStart = true;
  bool isHideOtpText = false;

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
      verifyOtp();
    } else {
      hasError = true;
    }
    makeButtonNotLoading();
  }

  startTimer() {
    isTimerStart = true;
    resendOTP();
    notifyListeners();
  }

  stopTimer() {
    isTimerStart = false;
    notifyListeners();
  }

  final formKeyPassword =
      GlobalKey<FormState>(debugLabel: 'reset_password_form_key');
  bool validatePassword() {
    bool valid = false;
    if (formKeyPassword.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }

  bool newPasswordVisible = false;
  newPasswordVissibility() {
    newPasswordVisible = !newPasswordVisible;
    notifyListeners();
  }

  bool cnfPasswordVisible = false;
  cnfPasswordVissibility() {
    cnfPasswordVisible = !cnfPasswordVisible;
    notifyListeners();
  }

  resetPassword() async {
    if (validatePassword()) {
      makeButtonLoading();
      ForgotPasswordParams forgotPasswordParams = ForgotPasswordParams(
          newPassword: newPasswordController.text,
          cnfPassword: confirmPasswordController.text,
          phoneNumber: generateOTPArgs.phonNumber);
      final response = await forgotPasswordUsecase(forgotPasswordParams);
      response.fold((l) {
        l.handleError();
      }, (r) {
        if (r['status']) {
          Get.until((route) => Get.currentRoute == RouteList.initial);
        } else {
          if (r["message"] is String) {
            showMessage(r["message"]);
          } else {
            r["message"].forEach((key, value) {
              showMessage(value[0]);
            });
          }
        }
      });
      makeButtonNotLoading();
    }
  }

  resendOTP() async {
    GenerateOTPParams generateOTPParams =
        GenerateOTPParams(phoneNumber: generateOTPArgs.phonNumber);
    final response = await generateOTpUsecase(generateOTPParams);
    response.fold((l) {
      l.handleError();
    }, (r) {
      if (r["status"]) {
        showMessage("OTP resend!!");
      } else {
        if (r["message"] is String) {
          showMessage(r["message"]);
        } else {
          r["message"].forEach((key, value) {
            showMessage(value[0]);
          });
        }
      }
    });
  }

  verifyOtp() async {
    VerifyOTPParams verifyOTPParams = VerifyOTPParams(
        phoneNumber: generateOTPArgs.phonNumber,
        otp: textEditingController.text);
    final response = await verifyOTPUsecase(verifyOTPParams);
    response.fold((l) {
      l.handleError();
    }, (r) {
      if (r["status"]) {
        isHideOtpText = true;
      } else {
        if (r["message"] is String) {
          showMessage(r["message"]);
        } else {
          r["message"].forEach((key, value) {
            showMessage(value[0]);
          });
        }
      }
    });
    notifyListeners();
  }
}
