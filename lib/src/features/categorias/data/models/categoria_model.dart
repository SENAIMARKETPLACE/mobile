import 'dart:convert';

import 'package:cep/src/features/categorias/data/models/sub_categoria_model.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';

class CategoriaModel extends Categoria {
  const CategoriaModel({
    required super.id,
    required super.nome,
    required super.subCategorias,
  });

  factory CategoriaModel.fromEntity(Categoria entity) {
    return CategoriaModel(
      id: entity.id,
      nome: entity.nome,
      subCategorias: entity.subCategorias,
    );
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    var listSubCategoria = <SubCategoria>[];

    if (map['subCategorias'] != null) {
      listSubCategoria = (map['subCategorias'] as List)
          .map((e) => SubCategoriaModel.fromMap(e as Map<String, String>))
          .toList();
    } else {
      listSubCategoria = [];
    }

    return CategoriaModel(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      subCategorias: listSubCategoria,
    );
  }

  factory CategoriaModel.fromJson(String source) {
    return CategoriaModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        subCategorias,
      ];
}
