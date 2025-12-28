import 'package:savomart/presentation/core/navigation_screen/navigation_screen.dart';
import 'package:savomart/presentation/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:savomart/presentation/widgets/default_page_transition.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    AuthController authController = Get.find();
    authController.getUser();
    return AnimatedBuilder(
      animation: authController,
      builder: (context, child) => DefaultPageTransition(
        child: authController.user == null
            ? const LoginScreen()
            : const NavigationScreen(),
      ),
    );
  }
}
