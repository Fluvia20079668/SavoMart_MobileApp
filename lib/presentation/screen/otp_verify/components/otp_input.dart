import 'dart:async';

import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputs extends StatelessWidget {
  const OtpInputs({
    Key? key,
    required this.formKey,
    required this.errorController,
    required this.textEditingController,
    required this.onchangePinCode,
    this.isEnable = true,
    this.backgroundColor = whiteColor,
  }) : super(key: key);

  final Key formKey;
  final StreamController<ErrorAnimationType>? errorController;
  final TextEditingController textEditingController;
  final Function onchangePinCode;
  final bool isEnable;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: PinCodeTextField(
        backgroundColor: backgroundColor,
        enabled: isEnable,
        length: 4,
        obscureText: false,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 60,
            fieldWidth: 60,
            activeFillColor: Colors.white,
            inactiveColor: greyColor,
            selectedColor: greyColor),
        keyboardType: TextInputType.number,
        animationDuration: const Duration(milliseconds: 300),
        cursorColor: blackColor,
        errorAnimationController: errorController,
        controller: textEditingController,
        onCompleted: (v) {
          consoleLog("Completed");
        },
        onChanged: (value) {
          consoleLog(value);
          onchangePinCode(value);
        },
        validator: (v) {
          if (v!.length < 4) {
            return "";
          } else {
            return null;
          }
        },
        beforeTextPaste: (text) {
          consoleLog("Allowing to paste $text");
          return true;
        },
        appContext: context,
      ),
    );
  }
}
