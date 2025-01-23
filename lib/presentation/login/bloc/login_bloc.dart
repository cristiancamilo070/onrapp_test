// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final isEmailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email);
    emit(state.copyWith(email: event.email, isEmailValid: isEmailValid));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

// login_bloc.dart
  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    final isEmailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email);

    if (isEmailValid && event.password.isNotEmpty) {
      emit(state.copyWith(isLoading: true));

      // Simula la autenticación
      await Future.delayed(const Duration(seconds: 2));

      // Login exitoso
      emit(state.copyWith(isLoading: false, loginSuccess: true));
    } else {
      // Si la validación falla
      emit(state.copyWith(
        isEmailValid: isEmailValid,
        isPasswordValid: event.password.isNotEmpty,
      ));
    }
  }
}
