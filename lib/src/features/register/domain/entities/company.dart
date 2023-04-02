// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String id;
  final String nomeProprietario;
  final String? nomeFantasia;
  final String razaoSocial;
  final String cnpj;
  final String telefone;
  final String? logo;
  final String email;
  final String senha;
  final List<Address> endereco;
  // final List<String> produto;

  const Company({
    required this.id,
    required this.nomeProprietario,
    this.nomeFantasia,
    required this.razaoSocial,
    required this.cnpj,
    required this.telefone,
    this.logo,
    required this.email,
    required this.senha,
    required this.endereco,
    // required this.produto,
  });

  factory Company.instance() {
    return const Company(
      id: '',
      nomeProprietario: '',
      nomeFantasia: '',
      razaoSocial: '',
      cnpj: '',
      telefone: '',
      logo: '',
      email: '',
      senha: '',
      endereco: [],
      // produto: [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        nomeProprietario,
        nomeFantasia,
        razaoSocial,
        cnpj,
        telefone,
        logo,
        email,
        senha,
        endereco,
        // produto,
      ];
}
