import 'package:find_seat/app_config.dart';
import 'package:find_seat/model/repo/home_repository.dart';
import 'package:find_seat/model/repo/user_repository.dart';
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

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (context) => userRepository),
        RepositoryProvider<HomeRepository>(create: (context) => homeRepository),
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
