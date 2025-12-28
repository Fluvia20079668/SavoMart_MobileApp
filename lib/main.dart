import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/route/routes.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/utils/initiate_app_utils.dart';
import 'package:savomart/utils/user_preference_utils.dart';
import 'package:savomart/l10n/app_localizations.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = setupLocale();
    return GetMaterialApp(
      title: 'Savo Mart',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: themeData(context),
      themeMode: ThemeMode.light,
      initialRoute: RouteList.splash,
      // initialRoute: RouteList.cmsScreen,
      getPages: Routes.getPages(),
    );
  }
}
