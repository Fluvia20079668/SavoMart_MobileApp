import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/login_screen/login_screen_controller.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:savomart/presentation/widgets/default_text_with_button.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:get/get.dart';

import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>(debugLabel: 'login_form_key');

    LoginScreenController loginScreenController = Get.find();
    return AnimatedBuilder(
      animation: loginScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  Image.asset(
                    "assets/logo.png",
                    width: MediaQuery.of(context).size.width * .25,
                  ),
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context)!.login,
                        style: Theme.of(context).textTheme.headline6BoldBlack()),
                  ),
                  defaultSpacer,
                  LoginForm(
                    loginScreenController: loginScreenController,
                    formKey: formKey,
                  ),
                  defaultSpacer,
                  GestureDetector(
                    onTap: () =>
                        loginScreenController.forgotPasswordClick(context),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppLocalizations.of(context)!.forgot_password,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  defaultSpacer,
                  SizedBox(
                    width: double.infinity,
                    child: DefaultGradiantButtonRounded(
                        text: AppLocalizations.of(context)!.login,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginScreenController.login();
                          }
                        },
                        isLoading: loginScreenController.buttonLoading),
                  ),
                  const SizedBox(
                    height: defaultPadding * 1.5,
                  ),
                  // const DefaultDivider(),
                  // defaultSpacer,
                  // const SocialLogin(),
                  // const SizedBox(
                  //   height: defaultPadding * 1.5,
                  // ),
                  DefaultTextWithButton(
                    labelText:
                        AppLocalizations.of(context)!.dont_have_an_account,
                    buttonText: AppLocalizations.of(context)!.sign_up,
                    onTap: () {
                      Get.until(
                          (route) => Get.currentRoute == RouteList.initial);
                      Get.toNamed(RouteList.registerScreen);
                    },
                  ),
                  defaultSpacer,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
