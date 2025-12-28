import 'dart:convert';
import 'package:savomart/domain/entities/onboarding_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:savomart/domain/entities/user_entity.dart';

import '../../../domain/params/api_input_params.dart';

class AuthController extends ChangeNotifier {
  AuthController() {
    getUser();
    observeUser();
    getIntro();
  }

  final box = GetStorage();

  UserEntity? get user => _userEntity;

  UserEntity? _userEntity;

  OnBoardEntity? get intro => _onBoardEntity;

  OnBoardEntity? _onBoardEntity;

  getUser() {
    String? jsonUser = box.read("user");
    if (jsonUser != null) {
      _userEntity = UserEntity.fromJson(jsonDecode(jsonUser));
    }
  }

  observeUser() {
    box.listenKey("user", (user) {
      if (user != null) {
        _userEntity = UserEntity.fromJson(jsonDecode(user));
      } else {
        _userEntity = null;
      }
      notifyListeners();
    });
  }

  // ApiInputParams getUserDetails() async {
  //   final sessionId = _userEntity!.sessionId;
  //   final userId = _userEntity!.userId;
  //   final language = Get.locale;
  //   ApiInputParams apiInputParams = ApiInputParams(sessionId: sessionId, userId: userId, language: language!.languageCode);
  //   return apiInputParams;
  // }

  getIntro() {
    String? jsonUser = box.read("intro");
    if (jsonUser != null) {
      _onBoardEntity = OnBoardEntity.fromJson(jsonDecode(jsonUser));
    }
  }

  getUserDetails() {
    final language = Get.locale;
    ApiInputParams apiInputParams = ApiInputParams( language: language!.languageCode);
    return apiInputParams;
  }
}
