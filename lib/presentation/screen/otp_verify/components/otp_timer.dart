import 'package:flutter/material.dart';

class OtpTimer extends StatelessWidget {
  const OtpTimer({
    Key? key,
    required this.stopOtpTimer,
  }) : super(key: key);

  final Function stopOtpTimer;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
        duration: const Duration(minutes: 1),
        tween: Tween(begin: const Duration(minutes: 1), end: Duration.zero),
        onEnd: () {
          stopOtpTimer();
        },
        builder: (BuildContext context, Duration value, Widget? child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text('$minutes:$seconds',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium));
        });
  }
}
