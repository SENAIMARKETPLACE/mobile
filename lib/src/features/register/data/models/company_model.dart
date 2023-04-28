import 'dart:convert';

import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';

class CompanyModel extends Company {
  final String idModel;
<<<<<<< HEAD
  final String nomeFantasiaModel;
  final String razaoSocialModel;
  final String cnpjModel;
  final String telefoneModel;
=======
  final String cnpjModel;
>>>>>>> front_cadastro
  final String emailModel;
  final String telefoneModel;
  final String senhaModel;
<<<<<<< HEAD
  final List<AddressModel> enderecoModel;
  // final String? logoModel;
  // final String nomeProprietarioModel;
  // final List<String> produtoModel;

  const CompanyModel({
    required this.idModel,
    required this.nomeFantasiaModel,
    required this.razaoSocialModel,
    required this.cnpjModel,
    required this.enderecoModel,
    required this.telefoneModel,
=======
  final String razaoSocialModel;
  final String nomeFantasiaModel;
  final AddressModel enderecoModel;
  final String logoModel;
  final String? nomeProprietarioModel;

  const CompanyModel({
    required this.idModel,
    required this.cnpjModel,
>>>>>>> front_cadastro
    required this.emailModel,
    required this.telefoneModel,
    required this.senhaModel,
    required this.nomeFantasiaModel,
    required this.razaoSocialModel,
    required this.enderecoModel,
    required this.logoModel,
    this.nomeProprietarioModel,
  }) : super(
          id: idModel,
<<<<<<< HEAD
          nomeFantasia: nomeFantasiaModel,
          razaoSocial: razaoSocialModel,
          email: emailModel,
          cnpj: cnpjModel,
          endereco: enderecoModel,
          senha: senhaModel,
          telefone: telefoneModel,
=======
          cnpj: cnpjModel,
          email: emailModel,
          telefone: telefoneModel,
          senha: senhaModel,
          nomeFantasia: nomeFantasiaModel,
          razaoSocial: razaoSocialModel,
          endereco: enderecoModel,
          logo: logoModel,
          nomeProprietario: nomeProprietarioModel,
>>>>>>> front_cadastro
        );

  factory CompanyModel.fromEntity(Company company) {
    return CompanyModel(
      idModel: company.id,
      cnpjModel: company.cnpj,
      razaoSocialModel: company.razaoSocial,
      enderecoModel: AddressModel.fromEntity(company.endereco),
      telefoneModel: company.telefone,
      emailModel: company.email,
      senhaModel: company.senha,
      nomeFantasiaModel: company.nomeFantasia,
    );
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    var listAddress = <AddressModel>[];

    if (map['enderecos'] != null) {
      listAddress = (map['enderecos'] as List)
          .map((e) => AddressModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } else {
      listAddress = [];
    }

    return CompanyModel(
<<<<<<< HEAD
      idModel: map['id'],
      cnpjModel: map['cnpj'],
      razaoSocialModel: map['razao_social'] ?? '',
      telefoneModel: map['telefone'],
      emailModel: map['email'] ?? '',
      senhaModel: map['senha'] ?? '',
      nomeFantasiaModel: map['nome_fantasia'],
      enderecoModel: listAddress
=======
      idModel: map['id'] ?? '',
      cnpjModel: map['cnpj'] ?? '',
      nomeProprietarioModel: map['nome_proprietario'] ?? '',
      razaoSocialModel: map['razao_social'],
      enderecoModel: map['endereco'] as AddressModel,
      telefoneModel: map['telefone'] ?? '',
      emailModel: map['email'] ?? '',
      senhaModel: map['senha'] ?? '',
      logoModel: map['url_logo'] ?? '',
      nomeFantasiaModel: map['nome_fantasia'] ?? '',
>>>>>>> front_cadastro
    );
  }

  factory CompanyModel.fromJson(String source) {
    return CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': idModel,
      'nome_fantasia': nomeFantasiaModel,
      'razao_social': razaoSocialModel,
      'cnpj': cnpjModel,
      'telefone': telefoneModel,
<<<<<<< HEAD
      'email': emailModel,
      'senha': senhaModel,
      'enderecos': enderecoModel.map((item) => item.toMap()).toList(),
=======
      'url_logo': logoModel,
      'email': emailModel,
      'senha': senhaModel,
      'endereco': enderecoModel,
      // 'nome_proprietario': nomeProprietarioModel,
      // 'id': idModel,
>>>>>>> front_cadastro
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        idModel,
        nomeFantasiaModel,
        razaoSocialModel,
        cnpjModel,
        telefoneModel,
        emailModel,
        senhaModel,
        enderecoModel,
        // produtoModel,
      ];
}
