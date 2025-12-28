import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: defaultPadding * 2.3,
        height: defaultPadding * 2.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding * .2),
            color: blackColor.withOpacity(.5)),
        child: const Icon(
          Icons.arrow_back,
          color: whiteColor,
        ),
      ),
    );
  }
}
