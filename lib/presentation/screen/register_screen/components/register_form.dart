import 'package:flutter_svg/svg.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/utils/formaters.dart';
import 'package:flutter/material.dart';

import '../register_screen_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key, required this.registerScreenController})
    : super(key: key);

  final RegisterScreenController registerScreenController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerScreenController.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: registerScreenController.nameControler,
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_name
                  : null;
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              isDense: true,
              hintText: AppLocalizations.of(context)!.name,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/user_name.svg",
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
          defaultSpacer,
          TextFormField(
            controller: registerScreenController.emailControler,
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_email
                  : !emailChecking(value)
                  ? AppLocalizations.of(context)!.please_enter_valid_email
                  : null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              isDense: true,
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/mail.svg", color: primaryColor),
                ],
              ),
            ),
          ),
          defaultSpacer,
          TextFormField(
            controller: registerScreenController.phoneControler,
            keyboardType: TextInputType.phone,
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_phone
                  : null;
            },
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.phone_number,
              isDense: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 1.5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/phone.svg",
                      color: primaryColor,
                    ),
                    // const Text("+966"),
                    // DefaultCountryCodePicker(
                    //   initalSelection:
                    //       registerScreenController.initialCountry,
                    //   onChange: registerScreenController.countryChange,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          defaultSpacer,
          TextFormField(
            controller: registerScreenController.passwordControler,
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.please_enter_password
                  : null;
            },
            obscureText: !registerScreenController.passwordVisible,
            decoration: InputDecoration(
              isDense: true,
              hintText: AppLocalizations.of(context)!.password,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/password.svg",
                    color: primaryColor,
                  ),
                ],
              ),
              suffixIcon: IconButton(
                onPressed: registerScreenController.passwordVissibility,
                icon: Icon(
                  registerScreenController.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          defaultSpacer,
          TextFormField(
            controller: registerScreenController.cnfpasswordControler,
            validator: (value) {
              return value!.isEmpty
                  ? AppLocalizations.of(context)!.enter_confirm_password
                  : registerScreenController.passwordControler.text != value
                  ? AppLocalizations.of(context)!.password_mismatch
                  : null;
            },
            obscureText: !registerScreenController.cnfpasswordVisible,
            decoration: InputDecoration(
              isDense: true,
              hintText: AppLocalizations.of(context)!.confirm_password,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/password.svg",
                    color: primaryColor,
                  ),
                ],
              ),
              suffixIcon: IconButton(
                onPressed: registerScreenController.cnfPasswordVissibility,
                icon: Icon(
                  registerScreenController.cnfpasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
