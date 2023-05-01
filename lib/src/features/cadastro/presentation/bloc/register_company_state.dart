// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/cadastro/domain/entities/address.dart';
import 'package:cep/src/features/cadastro/domain/entities/company.dart';

enum RegisterCompanyStatus { initial, loading, sucess, error }

class RegisterCompanyState extends Equatable {
  final RegisterCompanyStatus status;
  final String message;
  final Company company;
  final Address address;

  const RegisterCompanyState({
    required this.status,
    required this.message,
    required this.company,
    required this.address,
  });

  factory RegisterCompanyState.initial() => const RegisterCompanyState(
        status: RegisterCompanyStatus.initial,
        message: '',
        address: Address(
          cep: '',
          numero: '',
          estado: '',
          bairro: '',
          cidade: '',
          logradouro: '',
        ),
        company: Company(
          id: '',
          cnpj: '',
          email: '',
          telefone: '',
          senha: '',
          razaoSocial: '',
          nomeFantasia: '',
          endereco: Address(
            cep: '',
            numero: '',
            estado: '',
            bairro: '',
            cidade: '',
            logradouro: '',
          ),
          logo: '',
        ),
      );

  RegisterCompanyState copyWith({
    RegisterCompanyStatus? status,
    String? message,
    Company? company,
    Address? address,
  }) {
    return RegisterCompanyState(
      status: status ?? this.status,
      message: message ?? this.message,
      company: company ?? this.company,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        company,
        address,
      ];
}
