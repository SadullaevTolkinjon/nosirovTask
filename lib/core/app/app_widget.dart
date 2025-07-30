import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/router/router.dart';
import '../../domain/service/navigator/navigator_service.dart';
import '../utils/theme/main_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _MaterialApp();
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return child!;
      },
      child: EasyLocalization(
        saveLocale: true,
        supportedLocales: const [
          Locale('ru', 'RU'),
          Locale('uz', 'UZ'),
        ],
        path: 'assets/translation',
        startLocale: const Locale('ru', 'RU'),
        fallbackLocale: const Locale('ru', 'RU'),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              routerConfig: appRouter.config(
                deepLinkBuilder: (deepLink) {
                  if (appRouter.currentUrl.isNotEmpty) {
                    return DeepLink.path(appRouter.currentUrl);
                  }
                  if (deepLink.path.startsWith('/DeepLinkRoute')) {
                    return deepLink;
                  } else {
                    return DeepLink.defaultPath;
                  }
                },
              ),
              theme: MainTheme.light,
              key: NavigationService.navigatorKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              //  home: MainScreen(),
            );
          },
        ),
      ),
    );
  }
}
