import 'dart:convert';

import 'package:cep/src/features/categorias/data/models/categoria_model.dart';
import 'package:cep/src/features/produtos/data/models/detalhe_model.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';

class ProdutoModel extends Produto {
  const ProdutoModel({
    required super.id,
    required super.nome,
    required super.descricao,
    required super.preco,
    required super.foto,
    required super.publico,
    required super.categoria,
    required super.detalhes,
  });

  factory ProdutoModel.fromEntity(Produto entity) {
    return ProdutoModel(
      id: entity.id,
      nome: entity.nome,
      descricao: entity.descricao,
      preco: entity.preco,
      foto: entity.foto,
      publico: entity.publico,
      categoria: entity.categoria,
      detalhes: entity.detalhes,
    );
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      preco: map['preco'].toString(),
      foto: map['img'] ?? '',
      publico: map['publico'] ?? '',
      categoria: CategoriaModel.fromMap(map['categoria']),
      detalhes: DetalheModel.fromMap(map['detalhes_dos_produtos']),
    );
  }

  factory ProdutoModel.fromJson(String source) {
    return ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
