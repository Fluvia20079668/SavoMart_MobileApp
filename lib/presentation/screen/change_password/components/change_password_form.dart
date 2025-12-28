import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import '../change_password_controller.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    Key? key,
    required this.changePasswordController,
  }) : super(key: key);

  final ChangePasswordController changePasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: changePasswordController.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: changePasswordController.oldPasswordController,
              validator: (value) {
                return value!.isEmpty
                    ? AppLocalizations.of(context)!.enter_old_password
                    : null;
              },
              obscureText: !changePasswordController.passwordVisible,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.old_password,
                  isDense: true,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: changePasswordController.passwordVissibility,
                    icon: Icon(
                      changePasswordController.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryColor,
                    ),
                  )),
            ),
            defaultSpacer,
            TextFormField(
              controller: changePasswordController.newPasswordController,
              validator: (value) {
                return value!.isEmpty
                    ? AppLocalizations.of(context)!.please_enter_new_password
                    : null;
              },
              obscureText: !changePasswordController.newPasswordVisible,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.new_password,
                  isDense: true,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: changePasswordController.newPasswordVissibility,
                    icon: Icon(
                      changePasswordController.newPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryColor,
                    ),
                  )),
            ),
            defaultSpacer,
            TextFormField(
              controller: changePasswordController.confirmPasswordController,
              validator: (value) {
                return value!.isEmpty
                    ? AppLocalizations.of(context)!.enter_confirm_password
                    : changePasswordController.newPasswordController.text !=
                            value
                        ? AppLocalizations.of(context)!.password_mismatch
                        : null;
              },
              obscureText: !changePasswordController.cnfPasswordVisible,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.confirm_password,
                  isDense: true,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: changePasswordController.cnfPasswordVissibility,
                    icon: Icon(
                      changePasswordController.cnfPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryColor,
                    ),
                  )),
            ),
          ],
        ));
  }
}
