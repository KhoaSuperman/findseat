import 'package:find_seat/model/repo/user_repository.dart';
import 'package:find_seat/presentation/screen/login/bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginLoading(isWorking: false);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitEmailPasswordEvent) {
      yield* _mapLoginSubmitEmailPasswordEventToState(
          event.email, event.password);
    }
  }

  Stream<LoginState> _mapLoginSubmitEmailPasswordEventToState(
      String email, String password) async* {
    try {
      yield LoginLoading(isWorking: true);

      await _userRepository.signInWithCredentials(email, password);
      bool isSignedIn = await _userRepository.isSignedIn();

      yield LoginLoading(isWorking: false);

      if (isSignedIn) {
        yield LoginSuccess();
      } else {
        yield LoginFailed(msg: 'Wrong username & password');
      }
    } catch (e) {
      yield LoginLoading(isWorking: false);
      yield LoginFailed(msg: e.toString());
    }
  }
}
