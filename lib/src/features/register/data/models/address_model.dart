// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'dart:convert';

class AddressModel extends Address {
  final String cepModel;
  final String logradouroModel;
  final String bairroModel;
  final String localidadeModel;
  final String ufModel;
  final String numeroModel;
  final String? complementoModel;

  const AddressModel({
    required this.cepModel,
    required this.logradouroModel,
    required this.complementoModel,
    required this.bairroModel,
    required this.localidadeModel,
    required this.numeroModel,
    required this.ufModel,
  }) : super(
          bairro: bairroModel,
          cep: cepModel,
          cidade: localidadeModel,
          estado: ufModel,
          logradouro: logradouroModel,
          numero: numeroModel,
          complemento: complementoModel,
        );

  factory AddressModel.fromEntity(Address entity) {
    return AddressModel(
      cepModel: entity.cep,
      logradouroModel: entity.logradouro,
      complementoModel: entity.complemento,
      bairroModel: entity.bairro,
      localidadeModel: entity.cidade,
      ufModel: entity.estado,
      numeroModel: entity.numero,
    );
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cepModel: map["cep"] ?? '',
      logradouroModel: map["logradouro"] ?? '',
      complementoModel: map["complemento"] ?? '',
      bairroModel: map["bairro"] ?? '',
      localidadeModel: map["localidade"] ?? '',
      ufModel: map["uf"] ?? '',
      numeroModel: map['numero'] ?? '',
    );
  }

  factory AddressModel.fromJson(String source) {
    return AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cepModel,
      'logradouro': logradouroModel,
      'complemento': complementoModel,
      'bairro': bairroModel,
      'cidade': localidadeModel,
      'estado': ufModel,
      'numero': numeroModel
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        cepModel,
        logradouroModel,
        complementoModel,
        bairroModel,
        localidadeModel,
        ufModel,
      ];
}
