import 'dart:convert';

import 'package:cep/src/features/produtos/domain/entities/detalhes.dart';

class DetalheModel extends Detalhe {
  const DetalheModel({
    required super.id,
    required super.tamanho,
    required super.peso,
    required super.cor,
    required super.quantidade,
  });

  factory DetalheModel.fromEntity(Detalhe entity) {
    return DetalheModel(
      id: entity.id,
      tamanho: entity.tamanho,
      peso: entity.peso,
      cor: entity.cor,
      quantidade: entity.quantidade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "tamanho": tamanho,
      "peso": peso,
      "cor": cor,
      "quantidade": double.parse(quantidade),
    };
  }

  factory DetalheModel.fromMap(Map<String, dynamic> map) {
    return DetalheModel(
      id: map['id'].toString(),
      cor: map['cor'] ?? '',
      peso: map['peso'] ?? '',
      quantidade: map['quantidade'].toString(),
      tamanho: map['tamanho'] ?? '',
    );
  }

  factory DetalheModel.fromJson(String source) {
    return DetalheModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
