import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    openLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.DEFAULT,
        child: Center(
          child: SizedBox(
            width: 240,
            child: WidgetLogoFindSeat(),
          ),
        ),
      ),
    );
  }

  void openLogin() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, Router.LOGIN);
    });
  }
}
