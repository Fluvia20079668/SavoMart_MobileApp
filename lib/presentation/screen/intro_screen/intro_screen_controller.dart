import 'dart:convert';
import 'package:savomart/domain/entities/onboarding_entity.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroScreenController extends ChangeNotifier {
  final box = GetStorage();

  saveIntro(OnBoardEntity onBoardEntity) async {
    box.write("intro", jsonEncode(onBoardEntity));
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(RouteList.initial);
    notifyListeners();
  }
}
