import 'package:savomart/data/data_sources/auth_local_data_source.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/profile_screen/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_list_tile.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';
import '../../../domain/params/cms_args.dart';
import '../../widgets/default_alert_dialog.dart';
import 'components/profile_head_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();
    ProfileScreenController profileScreenController = Get.find();
    profileScreenController.getData();
    return AnimatedBuilder(
      animation: profileScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            centerTitle: false,
            title: Text(
              AppLocalizations.of(context)!.profile,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold, fontSize: defaultPadding),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeadSection(
                      profileScreenController: profileScreenController),
                  defaultSpacerSmall,
                  Divider(
                    thickness: defaultPadding * .15,
                    color: primaryColor.withOpacity(.05),
                  ),
                  defaultSpacerSmall,
                  DefaultText(
                    title: AppLocalizations.of(context)!.account,
                    fontSize: defaultPadding,
                    isBold: true,
                  ),
                  defaultSpacerSmall,
                  DefaultListTile(
                    assetName: 'assets/svgs/orderlist.svg',
                    title: AppLocalizations.of(context)!.my_orders,
                    onTap: () => Get.toNamed(RouteList.myOrdersScreen),
                  ),
                  DefaultListTile(
                    assetName: 'assets/svgs/wishlist.svg',
                    title: AppLocalizations.of(context)!.my_wishlist,
                    onTap: () => Get.toNamed(RouteList.wishlistScreen),
                  ),
                  DefaultListTile(
                    assetName: 'assets/svgs/address.svg',
                    title: AppLocalizations.of(context)!.my_address,
                    onTap: () => Get.toNamed(RouteList.myAddress),
                  ),
                  DefaultListTile(
                    assetName: 'assets/svgs/change_password.svg',
                    title: AppLocalizations.of(context)!.change_password,
                    onTap: () => Get.toNamed(RouteList.changePassword),
                  ),
                  DefaultListTile(
                    assetName: 'assets/svgs/terms_and_condition.svg',
                    title: AppLocalizations.of(context)!.terms_and_conditions,
                    onTap: () {
                      Get.toNamed(RouteList.cmsScreen,
                          arguments: CMSArgs(
                              cmsTitle: AppLocalizations.of(context)!
                                  .terms_and_conditions,
                              slug: "termsandconditions"));
                    },
                  ),
                  DefaultListTile(
                    assetName: 'assets/svgs/logout.svg',
                    title: AppLocalizations.of(context)!.logout,
                    iconColor: primaryColor,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      defaultPadding * .5)), //this right here
                              child: DefaultAlertDialog(
                                title:
                                    AppLocalizations.of(context)!.are_you_sure,
                                description: AppLocalizations.of(context)!
                                    .logout_message,
                                onTapFail: () {
                                  Get.back();
                                },
                                onTapSuccess: () {
                                  Get.back();
                                  authenticationLocalDataSource.deleteUser();
                                  Get.toNamed(RouteList.loginScreen);
                                },
                                negativeText: AppLocalizations.of(context)!.no,
                                positiveText: AppLocalizations.of(context)!.yes,
                                bgColorPositive: successColor,
                                bgColorNegative: errorColor,
                              ),
                            );
                          });
                    },
                  ),
                  defaultSpacer
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
