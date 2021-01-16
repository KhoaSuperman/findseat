import 'package:find_seat/model/repo/user_repository.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'barrel_login.dart';
import 'bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(userRepository: userRepository),
        child: Container(
          color: COLOR_CONST.DEFAULT,
          child: ListView(
            children: <Widget>[
              _buildTopWelcome(),
              _buildLoginForm(),
              _buildBottomSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTopWelcome() => WidgetTopWelcome();

  _buildLoginForm() => WidgetLoginForm();

  _buildBottomSignUp() => WidgetBottomSignUp();
}
