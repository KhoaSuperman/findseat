import 'package:find_seat/app_config.dart';
import 'package:find_seat/model/db/db.dart';
import 'package:find_seat/model/local/pref.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/home/sc_home.dart';
import 'package:find_seat/presentation/screen/login/barrel_login.dart';
import 'package:find_seat/presentation/screen/splash/sc_splash.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/router.dart';
import 'auth_bloc/bloc.dart';
import 'simple_bloc_delegate.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.DEFAULT,
        accentColor: COLOR_CONST.DEFAULT,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          } else if (state is Unauthenticated) {
            return LoginScreen();
          } else if (state is Authenticated) {
            return HomeScreen();
          }

          return Container(
            child: Center(child: Text('Unhandle State $state')),
          );
        },
      ),
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: COLOR_CONST.STATUS_BAR,
      ),
    );
  }

  static Widget runWidget() {
    WidgetsFlutterBinding.ensureInitialized();

    BlocSupervisor.delegate = SimpleBlocDelegate();

    final UserRepository userRepository = UserRepository();
    final HomeRepository homeRepository = HomeRepository();
    final ShowRepository showRepository = ShowRepository();
    final BookTimeSlotRepository bookTimeSlotRepository =
        RemoteBookTimeSlotRepository();
    final SessionRepository sessionRepository =
        SessionRepository(pref: LocalPref());
    final SeatSlotRepository seatSlotRepository = RemoteSeatSlotRepository();
    final TicketRepo ticketRepo = TicketRepo();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (context) => userRepository),
        RepositoryProvider<HomeRepository>(create: (context) => homeRepository),
        RepositoryProvider<ShowRepository>(create: (context) => showRepository),
        RepositoryProvider<BookTimeSlotRepository>(
            create: (context) => bookTimeSlotRepository),
        RepositoryProvider<SessionRepository>(
            create: (context) => sessionRepository),
        RepositoryProvider<SeatSlotRepository>(
            create: (context) => seatSlotRepository),
        RepositoryProvider<TicketRepo>(create: (context) => ticketRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(userRepository: userRepository)
                  ..add(AppStarted()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(homeRepository: homeRepository),
          ),
        ],
        child: MyApp(),
      ),
    );
  }
}
