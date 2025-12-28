
import 'package:savomart/domain/params/cms_args.dart';
import 'package:savomart/domain/params/register_params.dart';
import 'package:savomart/domain/usecases/register_user_usecase.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/utils/snackbar_uils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/route_constants.dart';

class RegisterScreenController extends ChangeNotifier {
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();
  final phoneControler = TextEditingController();
  final passwordControler = TextEditingController();
  final cnfpasswordControler = TextEditingController();
  
  RegisterUsecase registerUsecase = Get.find();

  bool buttonLoading = false;

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>(debugLabel: 'register_form_key');
  bool validate(BuildContext context) {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      if (!agreeToTerms) {
        showMessage(
            AppLocalizations.of(context)!.agree_to_the_terms_and_conditions);
      } else {
        valid = true;
      }
    }
    return valid;
  }

  bool passwordVisible = false;
  passwordVissibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  bool cnfpasswordVisible = false;
  cnfPasswordVissibility() {
    cnfpasswordVisible = !cnfpasswordVisible;
    notifyListeners();
  }

  void register(BuildContext context) async {
    if (validate(context)) {
      makeButtonLoading();
      RegisterParam registerParam = RegisterParam(
          firstname: nameControler.text,
          email: emailControler.text,
          phone: phoneControler.text,
          password: passwordControler.text,
          confirmPassword: cnfpasswordControler.text);
      final response = await registerUsecase(registerParam);

      response.fold((l) => {l.handleError()}, (r) {
        if (r['status']) {
          showMessage(r['message']);
          Get.toNamed(RouteList.loginScreen);
          Get.until((route) => Get.currentRoute == RouteList.initial);
          makeButtonNotLoading();
        } else {
          r["message"].forEach((key, value) {
            showMessage(value[0]);
          });
          // Get.back();
          makeButtonNotLoading();
        }
        makeButtonNotLoading();
      });

      // await Future.delayed(const Duration(seconds: 2));
      // Get.toNamed(RouteList.otpVerify);
      makeButtonNotLoading();
    }
  }

  String initialCountry = '+966';

  countryChange(value) {
    initialCountry = value.toString();
  }

  bool agreeToTerms = false;
  makeAgreedToTerms() {
    agreeToTerms = true;
    notifyListeners();
  }

  makeNotAgreeToTerms() {
    agreeToTerms = false;
    notifyListeners();
  }

  void tougleTermsAndCondition() {
    agreeToTerms ? makeNotAgreeToTerms() : makeAgreedToTerms();
  }

 

  showTermsAndConditions(BuildContext context) {
   Get.toNamed(RouteList.cmsScreen,arguments:CMSArgs(cmsTitle: AppLocalizations.of(context)!.terms_and_conditions, slug: "termsandconditions") );
  }
}
