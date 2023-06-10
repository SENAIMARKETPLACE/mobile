// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/produtos/domain/entities/detalhes.dart';

class Produto extends Equatable {
  final String id;
  final String? idCategoria;
  final String? idSubCategoria;
  final String? idEmpresa;
  final Detalhe? detalhe;
  final Categoria? categoria;
  final List<Detalhe>? detalhes;
  final String nome;
  final String descricao;
  final String preco;
  final String foto;
  final String publico;

  const Produto({
    required this.id,
    this.idCategoria,
    this.idSubCategoria,
    this.idEmpresa,
    this.detalhe,
    this.detalhes,
    this.categoria,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.foto,
    required this.publico,
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
    ];
  }

  @override
  bool get stringify => true;
}
