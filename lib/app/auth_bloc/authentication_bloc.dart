import 'package:find_seat/app/auth_bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/db/db.dart';
import 'package:find_seat/model/repo/user_repository.dart';
import 'package:flutter/material.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : super(Uninitialized());

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await userRepository.isSignedIn();

      //db
      await DbHelper.init();

      //for display splash screen
      await Future.delayed(Duration(seconds: 2));

      if (isSignedIn) {
        final name = await userRepository.getUser();
        yield Authenticated(name);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    userRepository.signOut();
  }
}
