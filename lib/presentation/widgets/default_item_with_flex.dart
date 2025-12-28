import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultItemwithFlex extends StatelessWidget {
  const DefaultItemwithFlex({
    Key? key,
    required this.keyText,
    required this.valueText,
    required this.keyTextStyle,
    required this.valueTextStyle,
  }) : super(key: key);

  final String keyText;
  final String valueText;
  final TextStyle keyTextStyle;
  final TextStyle valueTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            keyText,
            style: keyTextStyle,
          ),
        ),
        defaultSpacerHorizontalSmall,
        Text(":", style: keyTextStyle),
        defaultSpacerHorizontalSmall,
        Expanded(
          child: Text(valueText, style: valueTextStyle),
        )
      ],
    );
  }
}
