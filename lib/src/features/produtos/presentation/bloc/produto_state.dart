// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/produtos/domain/entities/produto.dart';

enum ProdutoStatus { initial, loading, success, error }

class ProdutoState extends Equatable {
  final ProdutoStatus status;
  final String message;
  final bool isSearch;
  final List<Produto> produtos;
  final List<Produto> produtosFiltro;
  final Produto product;

  const ProdutoState({
    required this.status,
    required this.message,
    required this.isSearch,
    required this.produtos,
    required this.produtosFiltro,
    required this.product,
  });

  factory ProdutoState.initial() => ProdutoState(
        status: ProdutoStatus.initial,
        message: '',
        isSearch: false,
        produtos: const [],
        produtosFiltro: const [],
        product: Produto.instance(),
      );

  @override
  List<Object> get props {
    return [
      status,
      message,
      isSearch,
      produtos,
      produtosFiltro,
      product
    ];
  }

  ProdutoState copyWith({
    ProdutoStatus? status,
    String? message,
    bool? isSearch,
    List<Produto>? produtos,
    List<Produto>? produtosFiltro,
    Produto? product,
  }) {
    return ProdutoState(
      status: status ?? this.status,
      message: message ?? this.message,
      isSearch: isSearch ?? this.isSearch,
      produtos: produtos ?? this.produtos,
      produtosFiltro: produtosFiltro ?? this.produtosFiltro,
      product: product ?? this.product,
    );
  }
}
