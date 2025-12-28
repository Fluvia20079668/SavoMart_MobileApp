import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key, this.isBack = true}) : super(key: key);

  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: scaffoldBg,
      centerTitle: false,
      // leading: Builder(
      //   builder: (context) => Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       defaultSpacerHorizontal,
      //       CustomIconButton(
      //         iconData: Icons.menu,
      //         iconColor: whiteColor,
      //         onTap: () => Scaffold.of(context).openDrawer(),
      //         backgroundColor: primaryColorLight,
      //       ),
      //     ],
      //   ),
      // ),
      automaticallyImplyLeading: isBack,
      title: Image.asset(
        "assets/logo.png",
        width: MediaQuery.of(context).size.width * .15,
        fit: BoxFit.contain,
      ),
      actions: [
        // CustomIconButton(
        //   iconData: Icons.notifications_none,
        //   onTap: () => Get.toNamed(RouteList.notificationScreen),
        // ),
        // defaultSpacerHorizontal,
        // Stack(
        //   children: [
        //     DefaultIconButton(
        //         onTap: () {
        //           consoleLog("notifications...");
        //         },
        //         iconUrl: "assets/svgs/ic_notification.svg"),
        //     Positioned(
        //       right: defaultPadding * .5,
        //       top: defaultPadding * .5,
        //       child: Container(
        //         width: defaultPadding * .6,
        //         height: defaultPadding * .6,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           color: primaryColorLight,
        //           borderRadius: BorderRadius.circular(defaultPadding * .5),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        defaultSpacerHorizontal,
      ],
    );
  }
}
