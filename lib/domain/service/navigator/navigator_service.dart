import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Static method to navigate without context
  static Future<void> navigateTo(MaterialPageRoute route) {
    return navigatorKey.currentState!.pushAndRemoveUntil(route, (ctx) => false);
  }

  // Static method to go back without context
  static void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
