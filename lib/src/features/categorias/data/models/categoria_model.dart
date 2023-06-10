import 'dart:convert';

import 'package:cep/src/features/categorias/data/models/sub_categoria_model.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';

class CategoriaModel extends Categoria {
  const CategoriaModel(
      {required super.id,
      required super.nome,
      required super.subCategorias,
      required super.subCategoria});

  factory CategoriaModel.fromEntity(Categoria entity) {
    return CategoriaModel(
        id: entity.id,
        nome: entity.nome,
        subCategorias: entity.subCategorias,
        subCategoria: entity.subCategoria);
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'] != null ? map['id'].toString() : '',
      nome: map['nome'] != null ? map['nome'].toString() : '',
      subCategorias: map['sub_categoria'] != null
          ? (map['sub_categoria'] as List)
              .map(
                (detalhes) =>
                    SubCategoriaModel.fromMap(detalhes as Map<String, dynamic>),
              )
              .toList()
          : [],
      subCategoria: null,
    );
  }
  factory CategoriaModel.fromMap2(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'] != null ? map['id'].toString() : '',
      nome: map['nome'] != null ? map['nome'].toString() : '',
      subCategoria: map['sub_categoria'] != null
          ? SubCategoriaModel.fromMap(map['sub_categoria'])
          : null,
      subCategorias: const [],
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
