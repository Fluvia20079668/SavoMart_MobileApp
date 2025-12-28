import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/app_logo.dart';

class Splash extends StatelessWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: const BoxDecoration(color: whiteColor
              // image: DecorationImage(
              //   image: AssetImage("assets/bg_splash.png"),
              //   fit: BoxFit.fill,
              // ),
              ),
          child: const Center(child: AppLogo())),
    );
  }
}
