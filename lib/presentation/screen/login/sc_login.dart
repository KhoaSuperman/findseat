import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import 'barrel_login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.DEFAULT,
        child: ListView(
          children: <Widget>[
            _buildTopWelcome(),
            _buildLoginForm(),
            _buildBottomSignUp(),
          ],
        ),
      ),
    );
  }

  _buildTopWelcome() => WidgetTopWelcome();

  _buildLoginForm() => WidgetLoginForm();

  _buildBottomSignUp() => WidgetBottomSignUp();
}
