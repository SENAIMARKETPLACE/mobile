// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String id;
  final String nomeFantasia;
  final String razaoSocial;
  final String cnpj;
  final String telefone;
  final String email;
  final String senha;
  final List<Address> endereco;
  // final String nomeProprietario;
  // final String? logo;
  // final List<String> produto;

  const Company({
    required this.id,
    required this.nomeFantasia,
    required this.razaoSocial,
    required this.cnpj,
    required this.telefone,
    required this.email,
    required this.senha,
    required this.endereco,
  });

  factory Company.instance() {
    return const Company(
      id: '',
      nomeFantasia: '',
      razaoSocial: '',
      cnpj: '',
      telefone: '',
      email: '',
      senha: '',
      endereco: [],
      // produto: [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        nomeFantasia,
        razaoSocial,
        cnpj,
        telefone,
        email,
        senha,
        endereco,
      ];
}
