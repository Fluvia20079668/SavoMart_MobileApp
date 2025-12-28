import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            consoleLog("facebook...");
          },
          child: Image.asset(
            "assets/facebook.png",
            width: defaultPadding * 1.8,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: defaultPadding * 3,
        ),
        GestureDetector(
          onTap: () {
            consoleLog("Google...");
          },
          child: Image.asset(
            "assets/google.png",
            width: defaultPadding * 1.8,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
