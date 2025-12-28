import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/widgets/default_icon_button.dart';

import 'package:savomart/l10n/app_localizations.dart';
import '../../../theme/theme.dart';
import '../../../widgets/default_text.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        gradient: defaultGradiant,
        borderRadius: BorderRadius.circular(defaultPadding * .5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            title: AppLocalizations.of(context)!.search_for_medical_equipment,
            color: whiteColor,
            isBold: true,
            fontSize: defaultPadding * .8,
          ),
          defaultSpacerSmall,
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteList.searchScreen);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * .45,
                vertical: defaultPadding * .3,
              ),
              decoration: BoxDecoration(
                color: scaffoldBg,
                borderRadius: BorderRadius.circular(defaultPadding * 2),
              ),
              child: Row(
                children: [
                  defaultSpacerHorizontalSmall,
                  SvgPicture.asset("assets/svgs/search.svg"),
                  defaultSpacerHorizontalSmall,
                  Expanded(
                    child: DefaultText(
                      title: AppLocalizations.of(context)!.search,
                      fontSize: defaultPadding * .7,
                    ),
                  ),
                  defaultSpacerHorizontalSmall,
                  DefaultIconButton(
                    onTap: () {},
                    iconUrl: "assets/svgs/ic_home_filter.svg",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
