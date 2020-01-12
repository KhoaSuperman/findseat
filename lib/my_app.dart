import 'package:find_seat/app_config.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var initialRoute = AppConfig.of(context).initialRoute;

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.DEFAULT,
        accentColor: COLOR_CONST.DEFAULT,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: initialRoute,
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: COLOR_CONST.STATUS_BAR,
      ),
    );
  }
}
