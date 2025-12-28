import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/reset_password/reset_password_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/otp_verify_reset.dart';
import 'components/reset_password_form.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController = Get.find();
    resetPasswordController.getData();
    return AnimatedBuilder(
      animation: resetPasswordController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: scaffoldBg,
            title: Text(
              AppLocalizations.of(context)!.reset_password,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: !resetPasswordController.isHideOtpText
                  ? OtpVerifyReset(
                      resetPasswordController: resetPasswordController)
                  : ResetPasswordForm(
                      resetPasswordController: resetPasswordController),
            ),
          ),
        );
      },
    );
  }
}
