import 'dart:convert';

import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';

class SubCategoriaModel extends SubCategoria {
  const SubCategoriaModel({
    required super.id,
    required super.nome,
  });

  factory SubCategoriaModel.fromEntity(SubCategoria entity) {
    return SubCategoriaModel(
      id: entity.id,
      nome: entity.nome,
    );
  }

  factory SubCategoriaModel.fromMap(Map<String, dynamic> map) {
    return SubCategoriaModel(
      id: map['id'] != null ? map['id'].toString() : '',
      nome: map['nome'] != null ? map['nome'].toString() : '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, String>{
      'nome': nome,
    };
  }

  factory SubCategoriaModel.fromJson(String source) {
    return SubCategoriaModel.fromMap(
        json.decode(source) as Map<String, String>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        id,
        nome,
      ];
}
