// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/register/domain/entities/address.dart';

enum RegisterCompanyStatus { initial, loading, sucess, error }

class RegisterCompanyState extends Equatable {
  final RegisterCompanyStatus status;
  final String message;
  final Address endereco;
  final bool isLoading;

  const RegisterCompanyState({
    required this.status,
    required this.message,
    required this.endereco,
    required this.isLoading,
  });

  factory RegisterCompanyState.initial() => const RegisterCompanyState(
        status: RegisterCompanyStatus.initial,
        message: '',
        isLoading: false,
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
    bool? isloading,
  }) {
    return RegisterCompanyState(
        status: status ?? this.status,
        message: message ?? this.message,
        endereco: endereco ?? this.endereco,
        isLoading: false);
  }

  @override
  List<Object?> get props => [
        status,
        message,
        endereco,
        isLoading,
      ];
}
