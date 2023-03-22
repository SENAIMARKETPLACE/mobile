// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';
import 'dart:convert';

class EnderecoModel extends Endereco {
  final String cepModel;
  final String logradouroModel;
  final String? complementoModel;
  final String bairroModel;
  final String localidade;
  final String uf;
  final String ibge;

  const EnderecoModel({
    required this.ibge,
    required this.cepModel,
    required this.logradouroModel,
    required this.complementoModel,
    required this.bairroModel,
    required this.localidade,
    required this.uf,
  }) : super(
          idUsuario: '',
          idEmpresa: '',
          id: ibge,
          bairro: bairroModel,
          cep: cepModel,
          cidade: localidade,
          estado: uf,
          logradouro: logradouroModel,
          numero: '',
          complemento: complementoModel,
        );

  factory EnderecoModel.fromEntity(Endereco endereco) {
    return EnderecoModel(
      ibge: '',
      cepModel: endereco.cep,
      logradouroModel: endereco.logradouro,
      complementoModel: endereco.complemento,
      bairroModel: endereco.bairro,
      localidade: endereco.cidade,
      uf: endereco.estado,
    );
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      ibge: map["ibge"],
      cepModel: map["cep"],
      logradouroModel: map["logradouro"],
      complementoModel: map["complemento"] ?? '',
      bairroModel: map["bairro"],
      localidade: map["localidade"],
      uf: map["uf"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ibge': ibge,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  factory EnderecoModel.fromJson(String source) {
    return EnderecoModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        cepModel,
        logradouroModel,
        complementoModel,
        bairroModel,
        localidade,
        uf,
        ibge,
      ];
}
