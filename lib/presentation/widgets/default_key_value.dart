import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';

class DefaultKeyValue extends StatelessWidget {
  const DefaultKeyValue({
    Key? key,
    required this.keyText,
    required this.valueText,
    this.keyColor = blackColor,
    this.valueColor = blackColor,
    this.keyWeight = FontWeight.normal,
    this.valueWeight = FontWeight.normal,
  }) : super(key: key);

  final String keyText;
  final String valueText;
  final Color keyColor;
  final Color valueColor;
  final FontWeight keyWeight;
  final FontWeight valueWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            keyText,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: keyColor, fontWeight: keyWeight),
          ),
        ),
        Text(
          valueText,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: valueColor, fontWeight: valueWeight),
        ),
      ],
    );
  }
}
