import 'package:savomart/presentation/screen/otp_verify/components/otp_input.dart';
import 'package:savomart/presentation/screen/otp_verify/components/otp_timer.dart';
import 'package:savomart/presentation/screen/otp_verify/components/resend_otp.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';

import '../reset_password_controller.dart';

class OtpVerifyReset extends StatelessWidget {
  const OtpVerifyReset({
    Key? key,
    required this.resetPasswordController,
  }) : super(key: key);

  final ResetPasswordController resetPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
          child: RichText(
            text: TextSpan(
                text:
                    "Please, enter the verification code we sent to your mobile ",
                children: [
                  TextSpan(
                      text:
                          resetPasswordController.generateOTPArgs.phonNumber,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: defaultPadding * .7)),
                ],
                style: const TextStyle(
                    color: blackColor, fontSize: defaultPadding * .7)),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: defaultPadding),
        OtpInputs(
          formKey: resetPasswordController.formKey,
          errorController: resetPasswordController.errorController!,
          textEditingController: resetPasswordController.textEditingController,
          onchangePinCode: resetPasswordController.onchangePin,
          isEnable: !resetPasswordController.isHideOtpText ? true : false,
          backgroundColor: scaffoldBg,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            resetPasswordController.hasError
                ? "*Please fill up all the cells properly"
                : "",
            style: const TextStyle(
              color: errorColor,
              fontSize: defaultPadding * .6,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        DefaultButton(
            text: "VERIFY",
            onPressed: resetPasswordController.otpVerify,
            isLoading: resetPasswordController.buttonLoading),
        defaultSpacerSmall,
        resetPasswordController.isTimerStart
            ? OtpTimer(
                stopOtpTimer: resetPasswordController.stopTimer,
              )
            : ResendOtp(
                startOtpTimer: resetPasswordController.startTimer,
              )
      ],
    );
  }
}
