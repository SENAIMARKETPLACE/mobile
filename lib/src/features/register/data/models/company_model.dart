// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final List<String> produtoModel;

  const CompanyModel({
    required this.idModel,
    required this.cnpjModel,
    required this.nomeProprietarioModel,
    required this.razaoSocialModel,
    this.nomeFantasiaModel,
    required this.enderecoModel,
    required this.telefoneModel,
    required this.produtoModel,
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
          produto: produtoModel,
          razaoSocial: razaoSocialModel,
          senha: senhaModel,
          telefone: telefoneModel,
        );

  // factory CompanyModel.fromMap();

  // factory CompanyModel.fromJson();

  // Map<String, dynamic> toMap() {}

  // String toJson() => json.encode(toMap());

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
        produtoModel,
      ];
}
