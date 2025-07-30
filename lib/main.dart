import 'package:flutter/material.dart';

import 'core/app/app_widget.dart';
import 'core/app_init.dart';

void main() async {
  await AppInit.create;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppWidget());
}
