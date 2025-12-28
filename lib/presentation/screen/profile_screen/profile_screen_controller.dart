import 'package:savomart/domain/usecases/user_info_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/params/no_params.dart';

class ProfileScreenController extends ChangeNotifier {
  String? profileNetworkImages;
  String? userName;

  UserInfoUseCase userInfoUseCase = Get.find();

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
    getData();
  }

  getData() async {
    final response = await userInfoUseCase(NoParams());
    response.fold((l) {
      l.handleError();
    }, (r) {
      if (r["status"]) {
        userName = r["user"]["first_name"];
        if (r["user"]["profile_picture_url"] != null &&
            r["user"]["profile_picture_url"] != "") {
          profileNetworkImages = r["user"]["profile_picture_url"];
        } else {
          profileNetworkImages = null;
        }
      }
    });
    notifyListeners();
  }
}
