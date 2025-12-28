import 'package:savomart/presentation/screen/otp_verify/otp_verify_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/otp_input.dart';
import 'components/otp_timer.dart';
import 'components/resend_otp.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpVerifyController otpVerifyController = Get.find();
    otpVerifyController.getData();
    return AnimatedBuilder(
      animation: otpVerifyController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(defaultPadding),
                      child: Image.asset('assets/otp.gif'),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * .2),
                    child: Text(
                      'Phone Number Verification',
                      style: Theme.of(context).textTheme.headline6BoldBlack(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8),
                    child: RichText(
                      text: TextSpan(
                          text:
                              "Please, enter the verification code we sent to your mobile ",
                          children: [
                            TextSpan(
                                text: "+91 8089118542",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ],
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 15)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  OtpInputs(
                    formKey: otpVerifyController.formKey,
                    errorController: otpVerifyController.errorController!,
                    textEditingController:
                        otpVerifyController.textEditingController,
                    onchangePinCode: otpVerifyController.onchangePin,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      otpVerifyController.hasError
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
                      onPressed: otpVerifyController.otpVerify,
                      isLoading: otpVerifyController.buttonLoading),
                  defaultSpacerSmall,
                  otpVerifyController.isTimerStart
                      ? OtpTimer(
                          stopOtpTimer: otpVerifyController.stopTimer,
                        )
                      : ResendOtp(
                          startOtpTimer: otpVerifyController.startTimer,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
