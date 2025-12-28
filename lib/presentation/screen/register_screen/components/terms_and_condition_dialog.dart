import 'package:savomart/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';

class TermsAndCoditionsDialog extends StatelessWidget {
  const TermsAndCoditionsDialog({
    Key? key,
    required this.termsAndConditions,
  }) : super(key: key);

  final String termsAndConditions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(defaultPadding * .5),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.terms_and_conditions,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          backgroundColor: whiteColor,
          actions: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                "assets/cancel.png",
                width: 20,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Html(
            data: termsAndConditions,
          ),
        ),
      ),
    );
  }
}
