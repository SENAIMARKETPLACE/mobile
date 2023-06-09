// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/produtos/domain/entities/produto.dart';

abstract class ProdutoEvent extends Equatable {
  const ProdutoEvent();
}

class GetProdutosEvent extends ProdutoEvent {
  final String idSubCategoria;
  final String idEmpresa;

  const GetProdutosEvent({
    required this.idSubCategoria,
    required this.idEmpresa,
  });

  @override
  List<Object?> get props => [
        idSubCategoria,
        idEmpresa,
      ];
}

class GetAllProdutosEvent extends ProdutoEvent {
  final String idEmpresa;

  const GetAllProdutosEvent({
    required this.idEmpresa,
  });

  @override
  List<Object?> get props => [
        idEmpresa,
      ];
}

class FiltroProdutoEvent extends ProdutoEvent {
  final String value;

  const FiltroProdutoEvent({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

class ExibSearchEvent extends ProdutoEvent {
  final bool isSearch;

  const ExibSearchEvent({
    required this.isSearch,
  });

  @override
  List<Object?> get props => [isSearch];
}

class CreateProdutoEvent extends ProdutoEvent {
  final Produto produto;

  const CreateProdutoEvent({
    required this.produto,
  });

  @override
  List<Object?> get props => [produto];
}
