// login_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isLoading;
  final bool loginSuccess;
  final GlobalKey<FormState> loginFormKey;

  LoginState({
    this.email = '',
    this.password = '',
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isLoading = false,
    this.loginSuccess = false,
    GlobalKey<FormState>? loginFormKey,
  }) : loginFormKey = loginFormKey ?? GlobalKey<FormState>();

  LoginState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isLoading,
    bool? loginSuccess,
    GlobalKey<FormState>? loginFormKey,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isLoading: isLoading ?? this.isLoading,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      loginFormKey: loginFormKey ?? this.loginFormKey,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, isEmailValid, isPasswordValid, isLoading, loginSuccess];
}
