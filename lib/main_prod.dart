import 'package:find_seat/app_config.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() {
  MyApp.initSystemDefault();

  runApp(
    AppConfig(
      appName: "FindSeat",
      debugTag: false,
      flavorName: "prod",
      initialRoute: AppRouter.SPLASH,
      child: MyApp.runWidget(),
    ),
  );
}
