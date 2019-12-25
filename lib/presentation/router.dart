import 'package:find_seat/presentation/screen/all_shows/barrel_all_shows.dart';
import 'package:find_seat/presentation/screen/login/sc_login.dart';
import 'package:find_seat/presentation/screen/show_info/barrel_show_info.dart';
import 'package:flutter/material.dart';

import 'screen/home/sc_home.dart';
import 'screen/splash/sc_splash.dart';

class Router {
  static const String HOME = '/';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String ALL_SHOWS = '/all_shows';
  static const String SHOW_INFO = '/show_info';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case ALL_SHOWS:
        return MaterialPageRoute(builder: (_) => AllShowsScreen());
      case SHOW_INFO:
        return MaterialPageRoute(builder: (_) => ShowInfoScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
