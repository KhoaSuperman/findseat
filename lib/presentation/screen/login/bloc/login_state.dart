import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String msg;

  LoginFailed({@required this.msg});

  @override
  List<Object> get props => [msg];
}

class LoginLoading extends LoginState {
  final bool isWorking;

  LoginLoading({@required this.isWorking});

  @override
  List<Object> get props => [isWorking];
}
