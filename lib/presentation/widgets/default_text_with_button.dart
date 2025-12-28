import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultTextWithButton extends StatelessWidget {
  const DefaultTextWithButton({
    Key? key,
    required this.labelText,
    required this.buttonText,
    required this.onTap,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  final String labelText;
  final String buttonText;
  final VoidCallback onTap;
  final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style:
              const TextStyle(color: blackColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: defaultPadding * .2,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
                decoration: decoration,
                color: primaryColor,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
