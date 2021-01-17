import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/screen/all_shows/barrel_all_shows.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/barrel_book_seat_slot.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_type/barrel_book_seat_type.dart';
import 'package:find_seat/presentation/screen/list_all_cine/barrel_list_all_cine.dart';
import 'package:find_seat/presentation/screen/list_my_ticket/sc_list_my_ticket.dart';
import 'package:find_seat/presentation/screen/login/sc_login.dart';
import 'package:find_seat/presentation/screen/register/barrel_register.dart';
import 'package:find_seat/presentation/screen/show_info/barrel_show_info.dart';
import 'package:flutter/material.dart';

import 'screen/home/sc_home.dart';
import 'screen/splash/sc_splash.dart';

class AppRouter {
  static const String HOME = '/';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String ALL_SHOWS = '/all_shows';
  static const String SHOW_INFO = '/show_info';
  static const String BOOK_TIME_SLOT = '/book_time_slot';
  static const String BOOK_SEAT_TYPE = '/book_seat_type';
  static const String BOOK_SEAT_SLOT = '/book_seat_slot';
  static const String LIST_ALL_CINE = '/list_all_cine';
  static const String REGISTER = '/register';
  static const String LIST_MY_TICKET = '/list_my_ticket';

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
        var show = settings.arguments as Show;
        return MaterialPageRoute(builder: (_) => ShowInfoScreen(show: show));
      case BOOK_TIME_SLOT:
        var show = settings.arguments as Show;
        return MaterialPageRoute(
            builder: (_) => BookTimeSlotScreen(show: show));
      case BOOK_SEAT_TYPE:
        return MaterialPageRoute(
          builder: (_) => BookSeatTypeScreen(),
        );
      case BOOK_SEAT_SLOT:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (_) => BookSeatSlotScreen(args: args));
      case LIST_ALL_CINE:
        return MaterialPageRoute(builder: (_) => ListAllCineScreen());
      case REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case LIST_MY_TICKET:
        return MaterialPageRoute(builder: (_) => ListMyTicketScreen());
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
