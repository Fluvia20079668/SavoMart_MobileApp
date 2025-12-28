import 'package:savomart/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'default_button.dart';

class DefaultAlertDialog extends StatelessWidget {
  const DefaultAlertDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onTapSuccess,
    required this.onTapFail,
    required this.negativeText,
    required this.positiveText,
    this.bgColorNegative,
    this.bgColorPositive,
    this.textColorNegative = whiteColor,
    this.textColorPositive = whiteColor,
  });

  final String title;
  final String description;
  final String negativeText;
  final String positiveText;
  final VoidCallback onTapSuccess;
  final VoidCallback onTapFail;
  final Color? bgColorNegative;
  final Color? bgColorPositive;
  final Color textColorNegative;
  final Color textColorPositive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultPadding * 10,
      width: defaultPadding * 17,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * .5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6BoldBlack(),
            ),
            defaultSpacerSmall,
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: blackColor),
            ),
            const SizedBox(
              height: kToolbarHeight * .5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
                  child: DefaultButton(
                    text: AppLocalizations.of(context)!.no,
                    height: defaultPadding * 2.2,
                    elevation: 0,
                    onPressed: onTapFail,
                    isLoading: false,
                    backgroundColor: bgColorNegative!,
                  ),
                ),
                defaultSpacerHorizontal,
                SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
                  child: DefaultButton(
                      text: AppLocalizations.of(context)!.yes,
                      height: defaultPadding * 2.2,
                      elevation: 0,
                      onPressed: onTapSuccess,
                      backgroundColor: bgColorPositive!,
                      isLoading: false),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
