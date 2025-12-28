import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/theme/theme.dart';

showMessage(String message) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    content: Row(
      children: [
        Expanded(
            child: Text(
          message,
          style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
              fontSize: defaultPadding * .7,
              fontWeight: FontWeight.bold,
              color: whiteColor),
        ))
      ],
    ),
    elevation: 0,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: primaryColorDark,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5)),
  ));
}
