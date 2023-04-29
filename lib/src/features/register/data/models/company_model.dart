import 'dart:convert';

import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';

class CompanyModel extends Company {
  final String idModel;
  final String cnpjModel;
  final String emailModel;
  final String telefoneModel;
  final String senhaModel;
  final String razaoSocialModel;
  final String nomeFantasiaModel;
  final AddressModel enderecoModel;
  final String logoModel;
  final String? nomeProprietarioModel;

  const CompanyModel({
    required this.idModel,
    required this.cnpjModel,
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
          cnpj: cnpjModel,
          email: emailModel,
          telefone: telefoneModel,
          senha: senhaModel,
          nomeFantasia: nomeFantasiaModel,
          razaoSocial: razaoSocialModel,
          endereco: enderecoModel,
          logo: logoModel,
          nomeProprietario: nomeProprietarioModel,
        );

  factory CompanyModel.fromEntity(Company company) {
    return CompanyModel(
      logoModel: '',
      nomeProprietarioModel: '',
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
      'url_logo': logoModel,
      'email': emailModel,
      'senha': senhaModel,
      'endereco': enderecoModel,
      // 'nome_proprietario': nomeProprietarioModel,
      // 'id': idModel,
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
