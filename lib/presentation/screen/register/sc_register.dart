import 'package:find_seat/app/auth_bloc/bloc.dart';
import 'package:find_seat/model/repo/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen();

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  late RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty &&
      _nameController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();

    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _confirmPasswordController.addListener(_onConfirmPasswordChanged);
    _nameController.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registering ... '),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }

        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.of(context).pop();
        }

        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registering Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (_) {
                      return !state.isEmailValid ? 'Invalid Email' : null;
                    },
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_box),
                      labelText: 'Display Name',
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (_) {
                      return !state.isNameValid ? 'Invalid Name' : null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    autocorrect: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (_) {
                      return !state.isPasswordValid ? 'Invalid Password' : null;
                    },
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                    autocorrect: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (_) {
                      return !state.isConfirmPasswordValid
                          ? 'Password does not matched'
                          : null;
                    },
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        _onFormSubmitted();
                      },
                      icon: Icon(Icons.send),
                      label: Text('Submit')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    ));
  }

  void _onConfirmPasswordChanged() {
    _registerBloc.add(ConfirmPasswordChanged(
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    ));
  }

  void _onNameChanged() {
    _registerBloc.add(NameChanged(name: _nameController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        displayName: _nameController.text,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
