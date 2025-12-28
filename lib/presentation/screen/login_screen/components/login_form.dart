import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../login_screen_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required this.loginScreenController, this.formKey})
      : super(key: key);

  final LoginScreenController loginScreenController;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: loginScreenController.phoneController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true), // OR keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              validator: (value) {
                return value!.isEmpty
                    ? AppLocalizations.of(context)!.please_enter_phone
                    : null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.phone_number,
                  isDense: true,
                  prefixIcon: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: defaultPadding / 1.5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: primaryColor,
                        ),
                        // Text("+966")
                        // DefaultCountryCodePicker(
                        //   initalSelection: loginScreenController.initialCountry,
                        //   onChange:() {},
                        // ),
                      ],
                    ),
                  ),
                  errorText: loginScreenController.errorText),
            ),
            defaultSpacer,
            TextFormField(
              controller: loginScreenController.passwordController,
              validator: (value) {
                return value!.isEmpty
                    ? AppLocalizations.of(context)!.please_enter_password
                    : null;
              },
              obscureText: !loginScreenController.passwordVisible,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  isDense: true,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: loginScreenController.passwordVissibility,
                    icon: Icon(
                      loginScreenController.passwordVisible
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
