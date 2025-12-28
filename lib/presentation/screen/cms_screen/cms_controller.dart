import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/domain/params/cms_args.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/terms_and_conditions_usecase.dart';

class CMSController extends ChangeNotifier {
  TermsAndConditionsUseCase termsAndConditionsUseCase = Get.find();
  CMSArgs cmsArgs = Get.arguments;

  String cmsSection = "";

  AppError? appError;
  bool isLoading = true;
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
    await getData();
  }

  getData() async {
    appError = null;
    final response = await termsAndConditionsUseCase(NoParams());
    response.fold((l) {
      l.handleError();
    }, (r) {
      if (r["status"]) {
        cmsSection = r["termsAndCondition"]["content"] ?? "";
      }
    });
    makeNotLoading();
  }
}
