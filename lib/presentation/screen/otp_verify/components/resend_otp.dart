import 'package:flutter/material.dart';

class ResendOtp extends StatelessWidget {
  const ResendOtp({
    Key? key,
    required this.startOtpTimer,
  }) : super(key: key);

  final Function startOtpTimer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't receive the code? ",
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        TextButton(
          onPressed: () {
            startOtpTimer();
          },
          child: const Text(
            "RESEND",
            style: TextStyle(
                color: Color(0xFF91D3B3),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}
