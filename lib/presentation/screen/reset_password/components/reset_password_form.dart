import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';

import '../reset_password_controller.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    Key? key,
    required this.resetPasswordController,
  }) : super(key: key);

  final ResetPasswordController resetPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: resetPasswordController.formKeyPassword,
          child: Column(
            children: [
              defaultSpacer,
              TextFormField(
                controller: resetPasswordController.newPasswordController,
                validator: (value) {
                  return value!.isEmpty
                      ? AppLocalizations.of(context)!.please_enter_new_password
                      : null;
                },
                obscureText: !resetPasswordController.newPasswordVisible,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.new_password,
                    isDense: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: resetPasswordController.newPasswordVissibility,
                      icon: Icon(
                        resetPasswordController.newPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                    )),
              ),
              defaultSpacer,
              TextFormField(
                controller: resetPasswordController.confirmPasswordController,
                validator: (value) {
                  return value!.isEmpty
                      ? AppLocalizations.of(context)!.enter_confirm_password
                      : resetPasswordController.newPasswordController.text !=
                              value
                          ? AppLocalizations.of(context)!.password_mismatch
                          : null;
                },
                obscureText: !resetPasswordController.cnfPasswordVisible,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.confirm_password,
                    isDense: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: resetPasswordController.cnfPasswordVissibility,
                      icon: Icon(
                        resetPasswordController.cnfPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                    )),
              ),
            ],
          ),
        ),
        defaultSpacer,
        DefaultGradiantButtonRounded(
            text: AppLocalizations.of(context)!.reset,
            onPressed: resetPasswordController.resetPassword,
            isLoading: resetPasswordController.buttonLoading)
      ],
    );
  }
}
