import 'package:savomart/data/data_sources/auth_local_data_source.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:savomart/presentation/core/navigation_screen/screens.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/home_screen/home_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/default_alert_dialog.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    NavigationScreenController navigationScreenController = Get.find();
    AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();
    return SizedBox(
      // width: MediaQuery.of(context).size.width * .8,
      child: Drawer(
        child: Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                defaultSpacer,
                DefaultListTile(
                  leading: Icons.home_outlined,
                  title: AppLocalizations.of(context)!.home,
                  onTap: () => {
                    Get.back(),
                    navigationScreenController.changeScreen(Screens.home.index)
                  },
                  isShowArrow: false,
                  color: whiteColor,
                ),
                DefaultListTile(
                  leading: Icons.person_outline,
                  title: AppLocalizations.of(context)!.account,
                  onTap: () =>
                      {Get.back(), Get.toNamed(RouteList.myAccountScreen)},
                  isShowArrow: false,
                  color: whiteColor,
                ),
                DefaultListTile(
                  leading: Icons.language,
                  title: AppLocalizations.of(context)!.language +
                      "  :  " +
                      AppLocalizations.of(context)!.locale,
                  onTap: homeScreenController.changeLocale,
                  isShowArrow: false,
                  color: whiteColor,
                ),
                // DefaultListTile(
                //   leading: Icons.notifications_none,
                //   title: AppLocalizations.of(context)!.notification,
                //   onTap: () =>
                //       {Get.back(), Get.toNamed(RouteList.notificationScreen)},
                //   isShowArrow: false,
                //   color: whiteColor,
                // ),
                DefaultListTile(
                  leading: Icons.account_tree_outlined,
                  title: AppLocalizations.of(context)!.orders,
                  onTap: () =>
                      {Get.back(), Get.toNamed(RouteList.myOrdersScreen)},
                  isShowArrow: false,
                  color: whiteColor,
                ),
                DefaultListTile(
                  leading: Icons.favorite_border,
                  title: AppLocalizations.of(context)!.wishlist,
                  onTap: () =>
                      {Get.back(), Get.toNamed(RouteList.wishlistScreen)},
                  isShowArrow: false,
                  color: whiteColor,
                ),
                DefaultListTile(
                  leading: Icons.logout,
                  title: AppLocalizations.of(context)!.logout,
                  onTap: () {
                    Get.back();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    defaultPadding * .5)), //this right here
                            child: DefaultAlertDialog(
                              title: AppLocalizations.of(context)!.are_you_sure,
                              description:
                                  AppLocalizations.of(context)!.logout_message,
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
                              bgColorPositive: primaryColor,
                              bgColorNegative: errorColor,
                            ),
                          );
                        });
                  },
                  isShowArrow: false,
                  color: whiteColor,
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(defaultPadding * .5),
            child: Text(
              "Version 3.5.0",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
