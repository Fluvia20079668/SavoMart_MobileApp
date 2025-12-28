import 'package:savomart/presentation/screen/splash_screen/components/splash.dart';
import 'package:savomart/presentation/screen/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/update_availabile.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashScreenController =
        Get.put(SplashScreenController());
    splashScreenController.checkVersion();
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: AnimatedBuilder(
          animation: splashScreenController,
          builder: (BuildContext context, Widget? child) {
            bool isLoading = splashScreenController.isLoading;
            bool forceUpdate = splashScreenController.forceUpdate;
            return isLoading
                ? const Splash()
                : UpdateAvailable(
                    forceUpdate: forceUpdate,
                    updateLater: splashScreenController.updateLater,
                    updateNow: splashScreenController.updateNow,
                  );
          },
        ),
      ),
    );
  }
}
