import 'dart:io';

import 'package:savomart/data/core/api_constants.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/utils/url_launcher_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends ChangeNotifier {
  bool isLoading = true;

  bool forceUpdate = false;

  AuthController authController = Get.find();

  AppError? appError;
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
    await Future.delayed(const Duration(seconds: 2));
    makeNotLoading();
  }

  // VersionCheck versionCheck = Get.find();

  pushAuthWrapper() {
    if (authController.intro == null) {
      Get.offAllNamed(RouteList.introScreen);
    } else {
      Get.offAllNamed(RouteList.initial);
    }
  }

  updateLater() {
    pushAuthWrapper();
  }

  updateNow() {
    UrlLauncherServices.launchInBrowser(
      Platform.isAndroid ? ApiConstants.playStoreUrl : ApiConstants.appStoreUrl,
    );
  }

  checkVersion() async {
    makeLoading();
    await Future.delayed(const Duration(seconds: 1));
    pushAuthWrapper();
  }
}
