import 'package:equatable/equatable.dart';

import 'package:cep/src/features/register/domain/entities/address.dart';

enum RegisterCompanyStatus { initial, loading, sucess, error }

class RegisterCompanyState extends Equatable {
  final RegisterCompanyStatus status;
  final String message;
  final Address endereco;

  const RegisterCompanyState({
    required this.status,
    required this.message,
    required this.endereco,
  });

  factory RegisterCompanyState.initial() => const RegisterCompanyState(
        status: RegisterCompanyStatus.initial,
        message: '',
        endereco: Address(
          id: '',
          cep: '',
          numero: '',
          estado: '',
          bairro: '',
          cidade: '',
          logradouro: '',
        ),
      );

  RegisterCompanyState copyWith({
    RegisterCompanyStatus? status,
    String? message,
    Address? endereco,
  }) {
    return RegisterCompanyState(
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
