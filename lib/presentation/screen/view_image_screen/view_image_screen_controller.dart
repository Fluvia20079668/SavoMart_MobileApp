import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/params/view_image_args.dart';

class ViewImageScreenController extends ChangeNotifier {
  ViewImageArgs viewImageArgs = Get.arguments;

  int activeIndex = 0;
  setActiveDot(index) {
    activeIndex = index;
    notifyListeners();
  }

  getData() {
    activeIndex = viewImageArgs.index;
    notifyListeners();
  }
}
