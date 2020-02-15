import 'package:find_seat/app/auth_bloc/bloc.dart';
import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/login/widget_btn_facebook.dart';
import 'package:find_seat/presentation/screen/login/widget_btn_google.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class WidgetLoginForm extends StatefulWidget {
  @override
  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  AuthenticationBloc _authenticationBloc;
  LoginBloc _loginBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          _authenticationBloc.add(LoggedIn());
        } else if (state is LoginFailed) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Login Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        } else if (state is LoginLoading) {
          if (state.isWorking) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Processing ...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          } else {
            Scaffold.of(context)..hideCurrentSnackBar();
          }
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: COLOR_CONST.WHITE,
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Login to your account',
                    style: FONT_CONST.MEDIUM_DEFAULT_16),
              ),
              WidgetSpacer(height: 20),
              _buildTextFieldUsername(),
              WidgetSpacer(height: 14),
              _buildTextFieldPassword(),
              WidgetSpacer(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password ?',
                  style: FONT_CONST.REGULAR_GRAY4_12,
                ),
              ),
              WidgetSpacer(height: 20),
              _buildButtonLogin(state),
              WidgetSpacer(height: 30),
              _buildTextOr(),
              WidgetSpacer(height: 20),
              _buildSocialLogin(),
            ],
          ),
        );
      }),
    );
  }

  _buildSocialLogin() {
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          WidgetBtnGoogle(),
          SizedBox(width: 20),
          WidgetBtnFacebook(),
        ],
      ),
    );
  }

  _buildTextOr() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Divider(
            color: COLOR_CONST.BLACK_30,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            color: COLOR_CONST.WHITE,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Text(
                'Or',
                style: FONT_CONST.REGULAR_GRAY5_10,
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildButtonLogin(LoginState state) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
        onPressed: () {
          _loginBloc.add(LoginSubmitEmailPasswordEvent(
            email: _emailController.text,
            password: _passwordController.text,
          ));
        },
        color: COLOR_CONST.DEFAULT,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'Login'.toUpperCase(),
          style: FONT_CONST.SEMIBOLD_WHITE_18,
        ),
      ),
    );
  }

  _buildTextFieldPassword() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: COLOR_CONST.GRAY3,
      ),
      child: Center(
        child: TextField(
          controller: _passwordController,
          style: FONT_CONST.REGULAR_GRAY1_12,
          maxLines: 1,
          keyboardType: TextInputType.text,
          obscureText: true,
          textAlign: TextAlign.left,
          decoration: InputDecoration.collapsed(
            hintText: 'Password',
          ),
        ),
      ),
    );
  }

  _buildTextFieldUsername() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: COLOR_CONST.GRAY3,
      ),
      child: Center(
        child: TextField(
          controller: _emailController,
          style: FONT_CONST.REGULAR_GRAY1_12,
          maxLines: 1,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.left,
          decoration: InputDecoration.collapsed(
            hintText: 'Username',
          ),
        ),
      ),
    );
  }
}
