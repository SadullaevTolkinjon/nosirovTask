import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../di/injection.dart';

class AppInit {
  AppInit._();

  static Future<AppInit> get create async {
    await appInitialized();

    return AppInit._();
  }

  static Future<void> appInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);

    /// Easy Localization
    await EasyLocalization.ensureInitialized();

    /// Get it configuration
    await configureDependencies();

    /// Easy loader

    /// hive init
    //await HiveService.init();

    /// env file initialize

    /// Device Orientation
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
