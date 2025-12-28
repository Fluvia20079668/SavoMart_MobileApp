import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ApplyCoupon extends StatelessWidget {
  const ApplyCoupon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * .5),
        child: Column(
          children: [
            // TitleWithButton(
            //   title: 'Apply Coupon',
            //   onTap: () {},
            //   buttonText: '',
            //   isButton: false,
            // ),
            // defaultSpacerSmall,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      return value!.isEmpty
                          ? AppLocalizations.of(context)!
                              .please_enter_coupon_code
                          : null;
                    },
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.coupon_code,
                      isDense: true,
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius:
                      //       BorderRadius.circular(defaultPadding * .25),
                      //   borderSide: const BorderSide(
                      //     color: primaryColor,
                      //   ),
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius:
                      //       BorderRadius.circular(defaultPadding * .25),
                      //   borderSide: const BorderSide(
                      //     color: greyColor,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                defaultSpacerHorizontalSmall,
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultPadding * .25),
                        ))),
                    child: Text(
                      AppLocalizations.of(context)!.apply,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: whiteColor),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
