import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginSubmitEmailPasswordEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitEmailPasswordEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
