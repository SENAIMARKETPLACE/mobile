import 'dart:convert';

import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';

class CompanyModel extends Company {
  final String idModel;
  final String nomeProprietarioModel;
  final String? nomeFantasiaModel;
  final String razaoSocialModel;
  final String cnpjModel;
  final String telefoneModel;
  final String? logoModel;
  final String emailModel;
  final String senhaModel;
  final List<AddressModel> enderecoModel;
  // final List<String> produtoModel;

  const CompanyModel({
    required this.idModel,
    required this.cnpjModel,
    required this.nomeProprietarioModel,
    required this.razaoSocialModel,
    this.nomeFantasiaModel,
    required this.enderecoModel,
    required this.telefoneModel,
    // required this.produtoModel,
    this.logoModel,
    required this.emailModel,
    required this.senhaModel,
  }) : super(
          id: idModel,
          cnpj: cnpjModel,
          email: emailModel,
          endereco: enderecoModel,
          logo: logoModel,
          nomeFantasia: nomeFantasiaModel,
          nomeProprietario: nomeProprietarioModel,
          // produto: produtoModel,
          razaoSocial: razaoSocialModel,
          senha: senhaModel,
          telefone: telefoneModel,
        );

  factory CompanyModel.fromEntity(Company company) {
    return CompanyModel(
        idModel: company.id,
        cnpjModel: company.cnpj,
        nomeProprietarioModel: company.nomeProprietario,
        razaoSocialModel: company.razaoSocial,
        enderecoModel: const [],
        telefoneModel: company.telefone,
        emailModel: company.email,
        senhaModel: company.senha,
        logoModel: company.logo,
        nomeFantasiaModel: company.nomeFantasia);
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      idModel: map['id'],
      cnpjModel: map['cnpj'],
      nomeProprietarioModel: map['nome_proprietario'],
      razaoSocialModel: map['razao_social'],
      enderecoModel: (map['enderecos'] as List)
          .map((e) => AddressModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      telefoneModel: map['telefone'],
      emailModel: map['email'],
      senhaModel: map['senha'],
      logoModel: map['foto'] ?? '',
      nomeFantasiaModel: map['nome_fantasia'],
    );
  }

  factory CompanyModel.fromJson(String source) {
    return CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome_fantasia': nomeFantasiaModel,
      'razao_social': razaoSocialModel,
      'cnpj': cnpjModel,
      'telefone': telefoneModel,
      'foto': logoModel,
      'email': emailModel,
      'senha': senhaModel,
      'enderecos': enderecoModel,
      'nome_proprietario': nomeProprietarioModel,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        idModel,
        nomeProprietarioModel,
        nomeFantasiaModel,
        razaoSocialModel,
        cnpjModel,
        telefoneModel,
        logoModel,
        emailModel,
        senhaModel,
        enderecoModel,
        // produtoModel,
      ];
}
