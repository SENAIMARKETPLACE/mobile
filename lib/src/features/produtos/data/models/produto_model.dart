import 'dart:convert';

import 'package:cep/src/features/categorias/data/models/categoria_model.dart';
import 'package:cep/src/features/produtos/data/models/detalhe_model.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';

class ProdutoModel extends Produto {
  const ProdutoModel({
    required super.id,
    super.idCategoria,
    super.idSubCategoria,
    super.idEmpresa,
    super.detalhe,
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
      idCategoria: entity.idCategoria,
      idEmpresa: entity.idEmpresa,
      idSubCategoria: entity.idSubCategoria,
      detalhe: entity.detalhe,
      nome: entity.nome,
      descricao: entity.descricao,
      preco: entity.preco,
      foto: entity.foto,
      publico: entity.publico,
      categoria: entity.categoria,
      detalhes: entity.detalhes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "empresa_id": int.tryParse(idEmpresa!),
      "categoria_id": int.parse(idCategoria!),
      "sub_categoria_id": int.parse(idSubCategoria!),
      "nome": nome,
      "descricao": descricao,
      "preco": 300,
      "img": foto,
      "publico": publico.toUpperCase(),
      "detalhes_do_produto": {
        "tamanho": detalhe!.tamanho,
        "peso": detalhe!.peso,
        "cor": detalhe!.cor,
        "quantidade": int.parse(detalhe!.quantidade)
      },
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['id'].toString(),
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      preco: map['preco'].toString(),
      foto: map['img'] ?? '',
      publico: map['publico'] ?? '',
      categoria:
          CategoriaModel.fromMap2(map['categoria'] as Map<String, dynamic>),
      detalhes: (map['detalhes_dos_produtos'] as List)
          .map(
            (detalhes) =>
                DetalheModel.fromMap(detalhes as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  factory ProdutoModel.fromJson(String source) {
    return ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
