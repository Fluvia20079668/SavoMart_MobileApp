import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:savomart/di/di.dart';
import 'package:savomart/presentation/theme/theme.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await GetStorage.init();
  DependencyInjection.init();
  setSystemOverlay();
  // await setupNotification();
}
