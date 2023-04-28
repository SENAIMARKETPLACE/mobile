import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String id;
<<<<<<< HEAD
  final String nomeFantasia;
  final String razaoSocial;
  final String cnpj;
  final String telefone;
=======
  final String cnpj;
>>>>>>> front_cadastro
  final String email;
  final String telefone;
  final String senha;
<<<<<<< HEAD
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
=======
  final String nomeFantasia;
  final String razaoSocial;
  final Address endereco;
  final String logo;
  final String? nomeProprietario;

  const Company({
    required this.id,
    required this.cnpj,
>>>>>>> front_cadastro
    required this.email,
    required this.telefone,
    required this.senha,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.endereco,
<<<<<<< HEAD
=======
    required this.logo,
    this.nomeProprietario,
>>>>>>> front_cadastro
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
      endereco: Address(
        cep: '',
        numero: '',
        estado: '',
        bairro: '',
        cidade: '',
        logradouro: '',
      ),
    );
  }

  @override
  List<Object?> get props => [
        id,
<<<<<<< HEAD
        nomeFantasia,
        razaoSocial,
        cnpj,
        telefone,
        email,
        senha,
        endereco,
=======
        cnpj,
        email,
        telefone,
        senha,
        nomeFantasia,
        razaoSocial,
        endereco,
        logo,
        nomeProprietario,
>>>>>>> front_cadastro
      ];
}
