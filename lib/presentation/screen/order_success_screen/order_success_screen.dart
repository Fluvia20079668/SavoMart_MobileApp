import 'package:flutter_svg/flutter_svg.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:savomart/presentation/core/navigation_screen/screens.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/cart_screen/cart_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationScreenController navigationScreenController = Get.find();
    CartScreenController cartScreenController = Get.find();
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldBg,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(defaultPadding * .7),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svgs/order_success.svg"),
                    const SizedBox(
                      height: kToolbarHeight * .4,
                    ),
                    DefaultText(
                      title: AppLocalizations.of(context)!.order_placed_success,
                      isBold: true,
                      isCenter: true,
                      fontSize: defaultPadding * 1.1,
                    ),
                    defaultSpacer,
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .4,
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       children: [
                    //         ...List.generate(3, (index) => const PlacedItem()),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Column(
                  children: [
                    DefaultText(
                      title:
                          AppLocalizations.of(context)!.order_success_message,
                      isCenter: true,
                      fontSize: defaultPadding * .65,
                    ),
                    defaultSpacerSmall,
                    DefaultButton(
                        text: AppLocalizations.of(context)!.continue_shopping,
                        elevation: 0,
                        isBold: true,
                        onPressed: () {
                          cartScreenController.getData();
                          Get.until(
                              (route) => Get.currentRoute == RouteList.initial);
                          navigationScreenController.currentScreen =
                              Screens.home;
                          navigationScreenController
                              .changeScreen(Screens.home.index);
                        },
                        isLoading: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
