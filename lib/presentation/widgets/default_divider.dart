import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: greyColorLight,
            thickness: defaultPadding * .1,
          ),
        ),
        defaultSpacerHorizontalSmall,
        Text(AppLocalizations.of(context)!.or),
        defaultSpacerHorizontalSmall,
        const Expanded(
          child: Divider(
            color: greyColorLight,
            thickness: defaultPadding * .1,
          ),
        ),
      ],
    );
  }
}
