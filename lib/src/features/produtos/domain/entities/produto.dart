// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/produtos/domain/entities/detalhes.dart';

class Produto extends Equatable {
  final String id;
  final String nome;
  final String descricao;
  final String preco;
  final String foto;
  final String publico;
  final Categoria categoria;
  final List<Detalhe> detalhes;

  const Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.foto,
    required this.publico,
    required this.categoria,
    required this.detalhes,
  });

  factory Produto.instance() {
    return Produto(
      id: '',
      nome: '',
      descricao: '',
      preco: '',
      foto: '',
      publico: '',
      categoria: Categoria.instance(),
      detalhes: const [],
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      nome,
      descricao,
      preco,
      foto,
      publico,
      categoria,
      detalhes,
    ];
  }
}
