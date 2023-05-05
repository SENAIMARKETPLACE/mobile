import 'dart:convert';

import 'package:cep/src/features/categorias/domain/entities/categoria.dart';

class CategoriaModel extends Categoria {
  const CategoriaModel({
    required super.id,
    required super.nome,
  });

  factory CategoriaModel.fromEntity(Categoria entity) {
    return CategoriaModel(
      id: entity.id,
      nome: entity.nome,
    );
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  factory CategoriaModel.fromJson(String source) {
    return CategoriaModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  List<Object?> get props => [
        id,
        nome,
      ];
}
