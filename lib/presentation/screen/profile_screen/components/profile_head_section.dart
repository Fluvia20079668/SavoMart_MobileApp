import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:savomart/l10n/app_localizations.dart';
import '../../../../utils/formaters.dart';
import '../../../route/route_constants.dart';
import '../../../theme/theme.dart';
import '../../../widgets/default_text.dart';
import '../profile_screen_controller.dart';

class ProfileHeadSection extends StatelessWidget {
  const ProfileHeadSection({
    super.key,
    required this.profileScreenController,
  });

  final ProfileScreenController profileScreenController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteList.myAccountScreen);
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            if (profileScreenController.userName != null)
              Container(
                width: MediaQuery.of(context).size.width * .2,
                height: MediaQuery.of(context).size.width * .2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: scaffoldBg,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * .2)),
                child: DefaultText(
                  title: firstLetter(profileScreenController.userName ?? ""),
                  fontSize: defaultPadding * 2,
                  isBold: true,
                  color: primaryColor.withOpacity(.5),
                ),
              ),
            defaultSpacerHorizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    title: profileScreenController.userName ?? "",
                    fontSize: defaultPadding * .9,
                    isBold: true,
                  ),
                  const SizedBox(
                    height: defaultPadding * .1,
                  ),
                  DefaultText(
                    title: AppLocalizations.of(context)!.show_profile,
                    fontSize: defaultPadding * .6,
                  ),
                ],
              ),
            ),
            defaultSpacerHorizontalSmall,
            SvgPicture.asset("assets/svgs/ic_arrow_right.svg")
          ],
        ),
      ),
    );
  }
}
