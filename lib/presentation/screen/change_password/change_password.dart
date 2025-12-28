import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/change_password/change_password_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/change_password_form.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangePasswordController changePasswordController = Get.find();
    return AnimatedBuilder(
      animation: changePasswordController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.reset_password,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  ChangePasswordForm(
                      changePasswordController: changePasswordController),
                  defaultSpacer,
                  DefaultGradiantButtonRounded(
                      text: AppLocalizations.of(context)!.reset,
                      onPressed: changePasswordController.changePassword,
                      isLoading: changePasswordController.buttonLoading)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
