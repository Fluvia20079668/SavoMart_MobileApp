// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultPadding = 20.0;
const defaultSpacer = SizedBox(height: defaultPadding);
const defaultSpacerSmall = SizedBox(height: defaultPadding / 2);
const defaultSpacerHorizontal = SizedBox(width: defaultPadding);
const defaultSpacerHorizontalSmall = SizedBox(width: defaultPadding / 2);

const sliverSpacer = SliverToBoxAdapter(child: defaultSpacer);

//const colours
const whiteColor = Colors.white;
const primaryColor = Color(0xFF00AF4C);
const primaryColorDark = Color(0xFF007C36);
const primaryColorLight = Color(0xFF99F5C4);
const orangeColor = Color(0xFFFFBC49);
const acsentColor = Color(0xFFE2EE96);
const acsentLight = Color(0xFFF9FFD3);
const blackColor = Color(0xFF000000);
const textColor = Color(0xFF191919);
const errorColor = Color(0xFFFF0000);
const successColor = Colors.green;
const greyColor = Color(0xFF8a8b8e);
const greyColorLight = Color(0xFFECECEC);
const productBg = Color(0xFFFBFBFB);
const scaffoldBg = Color(0xFFEDF9EC);
const navigationTextColor = Color(0xFFF9EFF1);
const warningColor = Colors.yellow;
const blueColor = Colors.blue;
const defaultGradiant = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  colors: [Color(0xFF00AF4C), Color(0xFF00D878)],
);
const greenGradiant = LinearGradient(
  colors: [Colors.greenAccent, Colors.lightGreen],
);

const defaultAnimationDuration = Duration(milliseconds: 500);

const defaultShadow = [
  BoxShadow(color: Colors.black26, offset: Offset(1.1, 1.1), blurRadius: 5),
];

setSystemOverlay() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //  DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid
          ? Brightness.light
          : Brightness.dark,
      // systemNavigationBarColor: Colors.white,
      // systemNavigationBarDividerColor: Colors.grey,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

// generateAnimatedRoute(RouteSettings settings) {
//   final routes = Routes.getRoutes(settings);
//   final WidgetBuilder builder = routes[settings.name]!;
//   return FadeScaleRouteBuilder(
//     builder: builder,
//   );
// }

class FadeScale extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    var curve = Curves.ease;
    var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
    return FadeTransition(opacity: animation.drive(tween), child: child);
  }
}

ThemeData themeData(context) {
  return ThemeData.light().copyWith(
    useMaterial3: false,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
      selectedLabelStyle: TextStyle(color: primaryColor),
    ),
    // textTheme: GoogleFonts.rubikTextTheme(),
    textTheme: GoogleFonts.interTextTheme(),
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: blackColor,
      labelColor: whiteColor,
      indicator: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(defaultPadding * .5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
      ),
    ),
    chipTheme: Theme.of(context).chipTheme.copyWith(
      secondaryLabelStyle: const TextStyle(color: whiteColor),
      secondarySelectedColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: blackColor),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: scaffoldBg,
      iconTheme: const IconThemeData(color: blackColor),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
    ),
    platform: TargetPlatform.iOS,
    cardTheme: CardThemeData(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding * .3,
        vertical: defaultPadding * .3,
      ),
      elevation: defaultPadding * .5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultPadding * .5),
      ),
      shadowColor: Colors.black38,
    ),
    scaffoldBackgroundColor: scaffoldBg,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: primaryColor),
      filled: true,
      fillColor: greyColor.withOpacity(.1),
      hintStyle: const TextStyle(
        color: textColor,
        fontSize: defaultPadding * .7,
      ),
      labelStyle: const TextStyle(
        color: textColor,
        fontSize: defaultPadding * .7,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        borderSide: const BorderSide(color: primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        borderSide: const BorderSide(color: greyColorLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        borderSide: const BorderSide(color: greyColorLight),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        borderSide: const BorderSide(color: errorColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        borderSide: const BorderSide(color: greyColorLight),
      ),
    ),
  );
}

extension ThemeExtension on TextTheme {
  TextStyle headline6BoldBlack() =>
      titleLarge!.copyWith(fontWeight: FontWeight.bold, color: blackColor);
  TextStyle headline6BoldPrimary() =>
      titleLarge!.copyWith(fontWeight: FontWeight.bold, color: primaryColor);
  TextStyle headline5BoldBlack() =>
      headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: blackColor);
  TextStyle bodyText1White() => bodyLarge!.copyWith(color: whiteColor);
  TextStyle bodyText1Blue() => bodyLarge!.copyWith(color: blueColor);
  TextStyle bodySubtitle1White() => titleMedium!.copyWith(color: whiteColor);
}
