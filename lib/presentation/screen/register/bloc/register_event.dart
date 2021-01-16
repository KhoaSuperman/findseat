import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}

class PasswordChanged extends RegisterEvent {
  final String password;
  final String confirmPassword;

  PasswordChanged({@required this.password, @required this.confirmPassword});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'PasswordChanged{password: $password, confirmPassword: $confirmPassword}';
  }
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String password;
  final String confirmPassword;

  ConfirmPasswordChanged(
      {@required this.password, @required this.confirmPassword});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ConfirmPasswordChanged{password: $password, confirmPassword: $confirmPassword}';
  }
}

class NameChanged extends RegisterEvent {
  final String name;

  NameChanged({@required this.name});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'NameChanged{name: $name}';
  }
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String displayName;

  const Submitted(
      {@required this.email,
      @required this.password,
      @required this.confirmPassword,
      @required this.displayName});

  @override
  List<Object> get props => [email, password, confirmPassword, displayName];

  @override
  String toString() {
    return 'Submitted{email: $email, password: $password, confirmPassword: $confirmPassword, displayName: $displayName}';
  }
}
