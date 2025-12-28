import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/register_screen/register_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/agree_to_terms.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:savomart/presentation/widgets/default_text_with_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/route_constants.dart';
import 'components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterScreenController registerScreenController = Get.find();
    return AnimatedBuilder(
      animation: registerScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight * 1.2,
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
                    child: Text(AppLocalizations.of(context)!.sign_up,
                        style:
                            Theme.of(context).textTheme.headline6BoldBlack()),
                  ),
                  defaultSpacer,
                  RegisterForm(
                      registerScreenController: registerScreenController),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  AgreeToTerms(
                    value: registerScreenController.agreeToTerms,
                    onChange: (value) =>
                        registerScreenController.tougleTermsAndCondition(),
                    onPressed: () {
                      registerScreenController.showTermsAndConditions(context);
                      registerScreenController.makeAgreedToTerms();
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DefaultGradiantButtonRounded(
                        text: AppLocalizations.of(context)!.sign_up,
                        onPressed: () =>
                            registerScreenController.register(context),
                        isLoading: registerScreenController.buttonLoading),
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
                    labelText: AppLocalizations.of(context)!.already_an_account,
                    buttonText: AppLocalizations.of(context)!.login,
                    onTap: () {
                      // registerScreenController.register(context);
                      Get.until(
                          (route) => Get.currentRoute == RouteList.initial);
                      Get.toNamed(RouteList.loginScreen);
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
