// ignore_for_file: deprecated_member_use

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/core/navigation_screen/screens.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/snackbar_uils.dart';
import 'navigation_screen_controller.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavigationScreenController navigationScreenController = Get.find();
    navigationScreenController.getData();
    return AnimatedBuilder(
      animation: navigationScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: navigationScreenController.currentScreen.index ==
                  Screens.profile.index
              ? whiteColor
              : scaffoldBg,
          body: WillPopScope(
            onWillPop: () {
              if (navigationScreenController.currentScreen == Screens.home) {
                DateTime now = DateTime.now();
                if (navigationScreenController.ctime == null ||
                    now.difference(navigationScreenController.ctime) >
                        const Duration(seconds: 2)) {
                  navigationScreenController.ctime = now;
                  showMessage('Press again to exit');
                  return Future.value(false);
                }
              } else {
                navigationScreenController.changeScreen(Screens.home.index);
                return Future.value(false);
              }
              return Future.value(true);
            },
            child: DefaultPageTransition(
              child: screens[navigationScreenController.currentScreen.index],
            ),
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: navigationScreenController.currentScreen.index,
            selectedColorOpacity: .15,
            selectedItemColor: primaryColor,
            onTap: (index) {
              navigationScreenController.changeScreen(index);
            },
            items: [
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                    navigationScreenController.currentScreen.index ==
                            Screens.home.index
                        ? "assets/navigation/ic_home_fill.svg"
                        : "assets/navigation/ic_home.svg"),
                title: Text(
                  AppLocalizations.of(context)!.home,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: defaultPadding * .55,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                    navigationScreenController.currentScreen.index ==
                            Screens.categories.index
                        ? "assets/navigation/ic_category_fill.svg"
                        : "assets/navigation/ic_category.svg"),
                title: Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: defaultPadding * .55,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SalomonBottomBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                        navigationScreenController.currentScreen.index ==
                                Screens.cart.index
                            ? "assets/navigation/ic_cart_fill.svg"
                            : "assets/navigation/ic_cart.svg"),
                    if (navigationScreenController.currentScreen.index !=
                            Screens.cart.index &&
                        navigationScreenController.cartCount != 0)
                      Positioned(
                        bottom: defaultPadding * .7,
                        left: defaultPadding * .7,
                        child: Container(
                          width: defaultPadding * .6,
                          height: defaultPadding * .6,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: errorColor,
                            borderRadius:
                                BorderRadius.circular(defaultPadding * .5),
                          ),
                        ),
                      )
                  ],
                ),
                title: Text(
                  AppLocalizations.of(context)!.cart,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: defaultPadding * .55,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                    navigationScreenController.currentScreen.index ==
                            Screens.profile.index
                        ? "assets/navigation/ic_profile_fill.svg"
                        : "assets/navigation/ic_profile.svg"),
                title: Text(
                  AppLocalizations.of(context)!.account,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: defaultPadding * .55,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GradiantContainer extends StatelessWidget {
  const GradiantContainer({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultPadding * 1.7,
      height: defaultPadding * 1.7,
      padding: const EdgeInsets.all(defaultPadding * .4),
      decoration: const BoxDecoration(
          gradient: defaultGradiant, shape: BoxShape.circle),
      child: SvgPicture.asset(
        imageUrl,
        width: defaultPadding,
        height: defaultPadding,
        color: whiteColor,
      ),
    );
  }
}
