import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultTitleWithStyle extends StatelessWidget {
  const DefaultTitleWithStyle({
    Key? key,
    required this.title,
    this.color = blackColor,
    this.isMandatory = false,
  }) : super(key: key);

  final String title;
  final Color color;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: color, fontWeight: FontWeight.bold),
        ),
        if (isMandatory)
          const SizedBox(
            width: defaultPadding * .1,
          ),
        if (isMandatory)
          Text(
            "*",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: errorColor),
          )
      ],
    );
  }
}
