import 'package:find_seat/model/repo/user_repository.dart';
import 'package:find_seat/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';
import 'package:bloc/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> transformEvents(Stream<RegisterEvent> events,
      Stream<RegisterState> Function(RegisterEvent) next) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged &&
          event is! PasswordChanged &&
          event is! ConfirmPasswordChanged &&
          event is! NameChanged);
    });

    final debounceStream = events.where((event) {
      return (event is EmailChanged ||
          event is PasswordChanged ||
          event is ConfirmPasswordChanged ||
          event is NameChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password, event.confirmPassword);
    } else if (event is ConfirmPasswordChanged) {
      yield* _mapConfirmPasswordChangedToState(
          event.password, event.confirmPassword);
    } else if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password,
          event.confirmPassword, event.displayName);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(
      String password, String confirmPassword) async* {
    var isPasswordValid = Validators.isValidPassword(password);
    var isMatched = true;

    if (confirmPassword.isNotEmpty) {
      isMatched = password == confirmPassword;
    }

    yield state.update(
        isPasswordValid: isPasswordValid, isConfirmPasswordValid: isMatched);
  }

  Stream<RegisterState> _mapConfirmPasswordChangedToState(
      String password, String confirmPassword) async* {
    var isConfirmPasswordValid = Validators.isValidPassword(confirmPassword);
    var isMatched = true;

    if (password.isNotEmpty) {
      isMatched = password == confirmPassword;
    }

    yield state.update(
      isConfirmPasswordValid: isConfirmPasswordValid && isMatched,
    );
  }

  Stream<RegisterState> _mapNameChangedToState(String name) async* {
    yield state.update(
      isNameValid: Validators.isValidName(name),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(String email, String password,
      String confirmPassword, String displayName) async* {

    //need refactor
    var isValidEmail = Validators.isValidEmail(email);
    var isValidName = displayName.isNotEmpty;

    var isValidPassword = Validators.isValidPassword(password);
    var isValidConfirmPassword = Validators.isValidPassword(confirmPassword);
    var isMatched = true;
    if (isValidPassword && isValidConfirmPassword) {
      isMatched = password == confirmPassword;
    }

    var newState = state.update(
        isEmailValid: isValidEmail,
        isNameValid: isValidName,
        isPasswordValid: isValidPassword,
        isConfirmPasswordValid: isValidConfirmPassword && isMatched);

    yield newState;

    if (newState.isFormValid) {
      yield RegisterState.loading();

      try {
        await _userRepository.signUp(
            email: email, password: password, displayName: displayName);
        yield RegisterState.success();
      } catch (_) {
        yield RegisterState.failure();
      }
    }
  }
}
