import 'package:find_seat/app_config.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() {
  MyApp.initSystemDefault();

  runApp(
    AppConfig(
      appName: "FindSeat Dev",
      debugTag: true,
      flavorName: "dev",
      initialRoute: AppRouter.BOOK_SEAT_SLOT,
      child: MyApp.runWidget(),
    ),
  );
}
