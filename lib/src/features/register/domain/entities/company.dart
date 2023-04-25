import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String id;
  final String cnpj;
  final String email;
  final String telefone;
  final String senha;
  final String nomeFantasia;
  final String razaoSocial;
  final Address endereco;
  final String logo;
  final String? nomeProprietario;

  const Company({
    required this.id,
    required this.cnpj,
    required this.email,
    required this.telefone,
    required this.senha,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.endereco,
    required this.logo,
    this.nomeProprietario,
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
        cnpj,
        email,
        telefone,
        senha,
        nomeFantasia,
        razaoSocial,
        endereco,
        logo,
        nomeProprietario,
      ];
}
