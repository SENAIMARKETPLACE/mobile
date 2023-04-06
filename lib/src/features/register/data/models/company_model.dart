import 'dart:convert';

import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';

class CompanyModel extends Company {
  final String idModel;
  final String nomeFantasiaModel;
  final String razaoSocialModel;
  final String cnpjModel;
  final String telefoneModel;
  final String emailModel;
  final String senhaModel;
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
    required this.emailModel,
    required this.senhaModel,
  }) : super(
          id: idModel,
          nomeFantasia: nomeFantasiaModel,
          razaoSocial: razaoSocialModel,
          email: emailModel,
          cnpj: cnpjModel,
          endereco: enderecoModel,
          senha: senhaModel,
          telefone: telefoneModel,
        );

  factory CompanyModel.fromEntity(Company company) {
    List<AddressModel> listAddress = [];

    if (company.endereco.isNotEmpty) {
      for (final e in company.endereco) {
        final t = AddressModel.fromEntity(e);
        listAddress.add(t);
      }
    }

    return CompanyModel(
      idModel: company.id,
      cnpjModel: company.cnpj,
      razaoSocialModel: company.razaoSocial,
      enderecoModel: listAddress,
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
      idModel: map['id'],
      cnpjModel: map['cnpj'],
      razaoSocialModel: map['razao_social'] ?? '',
      telefoneModel: map['telefone'],
      emailModel: map['email'] ?? '',
      senhaModel: map['senha'] ?? '',
      nomeFantasiaModel: map['nome_fantasia'],
      enderecoModel: listAddress
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
      'email': emailModel,
      'senha': senhaModel,
      'enderecos': enderecoModel.map((item) => item.toMap()).toList(),
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
