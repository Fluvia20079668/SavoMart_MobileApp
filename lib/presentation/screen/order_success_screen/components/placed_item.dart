import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:savomart/l10n/app_localizations.dart';
import '../../../theme/theme.dart';
import '../../../widgets/default_text.dart';

class PlacedItem extends StatelessWidget {
  const PlacedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: defaultPadding*.5),
      padding: const EdgeInsets.all(defaultPadding * .6),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultPadding * .5)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultPadding * .5),
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width * .3,
              fit: BoxFit.cover,
              imageUrl:
                  "https://genesisdoctors.com/wp-content/uploads/2021/02/Rapid-Covid-Testing.jpg",
              errorWidget: (context, url, error) => Image.asset(
                "assets/no_image.png",
              ),
            ),
          ),
          defaultSpacerHorizontalSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultText(
                  title: "Medical Disposable",
                  maxLine: 1,
                  fontSize: defaultPadding * .5,
                  isBold: true,
                  color: primaryColor,
                ),
                const SizedBox(
                  height: defaultPadding * .1,
                ),
                const DefaultText(
                  title: "3-Ply Face Masks – 50 pcs",
                  maxLine: 2,
                  fontSize: defaultPadding * .6,
                  isBold: true,
                ),
                const SizedBox(
                  height: defaultPadding * .1,
                ),
                DefaultText(
                  title: "${AppLocalizations.of(context)!.price_symbol} 400",
                  fontSize: defaultPadding * .7,
                  isBold: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
