// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';

enum SignUpStatus { initial, loading, sucess, error }

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String message;
  final Endereco endereco;

  const SignUpState({
    required this.status,
    required this.message,
    required this.endereco,
  });

  factory SignUpState.initial() => const SignUpState(
        status: SignUpStatus.initial,
        message: '',
        endereco: Endereco(
          id: '',
          cep: '',
          numero: '',
          estado: '',
          bairro: '',
          cidade: '',
          logradouro: '',
        ),
      );

  SignUpState copyWith({
    SignUpStatus? status,
    String? message,
    Endereco? endereco,
  }) {
    return SignUpState(
      status: status ?? this.status,
      message: message ?? this.message,
      endereco: endereco ?? this.endereco,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        endereco,
      ];
}
