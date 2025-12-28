import 'package:savomart/data/data_sources/auth_local_data_source.dart';
import 'package:savomart/domain/params/generate_otp_args.dart';
import 'package:savomart/domain/usecases/generate_otp_usecase.dart';
import 'package:savomart/domain/usecases/login_user_usecase.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/params/auth_params.dart';
import '../../../utils/snackbar_uils.dart';

class LoginScreenController extends ChangeNotifier {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  LoginUserUsecase loginUserUsecase = Get.find();
  GenerateOTpUsecase generateOTpUsecase = Get.find();

  AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();

  bool buttonLoading = false;

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  bool passwordVisible = false;
  passwordVissibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void login() async {
    errorText = null;
    makeButtonLoading();
    AuthParams authParams = AuthParams(
        phone: phoneController.text,
        password: passwordController.text,
        deviceIdentity: 'customer_registration');
    final response = await loginUserUsecase(authParams);
    response.fold((l) => l.handleError(), (r) {
      if (r['status']) {
        // showMessage(r['message']);
        Get.until((route) => Get.currentRoute == RouteList.initial);
        phoneController.clear();
        passwordController.clear();
        makeButtonNotLoading();
      } else {
        showMessage(r["message"]);
        makeButtonNotLoading();
      }
    });
    notifyListeners();
  }

  String initialCountry = '+966';

  countryChange(value) {
    initialCountry = value.toString();
  }

  validateForgotPassword() {
    bool valid = false;
    if (phoneController.text.isNotEmpty) {
      valid = true;
    }
    return valid;
  }

  String? errorText;
  forgotPasswordClick(BuildContext context) async {
    errorText = null;
    if (validateForgotPassword()) {
      GenerateOTPParams generateOTPParams =
          GenerateOTPParams(phoneNumber: phoneController.text);
      final response = await generateOTpUsecase(generateOTPParams);
      response.fold((l) {
        l.handleError();
      }, (r) {
        if (r["status"]) {
          Get.toNamed(RouteList.restPassword,
              arguments: GenerateOTPArgs(phonNumber: phoneController.text));
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
    } else {
      errorText = AppLocalizations.of(context)!.please_enter_phone;
      notifyListeners();
    }
  }
}
