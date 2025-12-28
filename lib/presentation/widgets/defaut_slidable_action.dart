import 'package:savomart/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class DefaultSlidableAction extends StatelessWidget {
  const DefaultSlidableAction({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .25,
        height: MediaQuery.of(context).size.height * .12,
        margin: const EdgeInsets.only(top: defaultPadding * .25),
        padding: const EdgeInsets.all(defaultPadding * .2),
        decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(defaultPadding * .3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.delete,
              color: whiteColor,
            ),
            const SizedBox(
              height: defaultPadding * .1,
            ),
            Text(
              AppLocalizations.of(context)!.delete,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: defaultPadding * .6,
                  color: whiteColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
