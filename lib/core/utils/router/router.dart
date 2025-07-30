import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nosirovtask/presentation/allow_access_location/allow_access_location_page.dart';
import 'package:nosirovtask/presentation/location/location_page.dart';

import '../../../presentation/initial/initial_page.dart';
import '../../../presentation/main/main_page.dart';
import '../../../presentation/splash/splash_page.dart';

part 'router.gr.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final appRouter = AppRouter(navigatorKey: globalNavigatorKey);

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey}) : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        AutoRoute(page: InitialRoute.page, path: "/initial"),
        AutoRoute(page: AllowAccessLocationRoute.page, path: "/allow-access-location"),
        AutoRoute(page: LocationRoute.page, path: "/location"),
      ];
}
