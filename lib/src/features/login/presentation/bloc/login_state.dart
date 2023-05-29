// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum LoginStatus {
  success,
  failure,
  loading,
  initial,
}

class LoginState extends Equatable {
  final String message;
  final LoginStatus status;

  const LoginState({
    required this.message,
    required this.status,
  });

  factory LoginState.initial() => const LoginState(
        message: '',
        status: LoginStatus.initial,
      );

  LoginState copyWith({
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
      ];
}
