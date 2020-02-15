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

  PasswordChanged({@required this.password});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';
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
  final String displayName;

  const Submitted(
      {@required this.email,
      @required this.password,
      @required this.displayName});

  @override
  List<Object> get props => [email, password, displayName];

  @override
  String toString() {
    return 'Submitted{email: $email, password: $password, displayName: $displayName}';
  }
}
