// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:equatable/equatable.dart';

abstract class ProdutoEvent extends Equatable {
  const ProdutoEvent();
}

class GetProdutosEvent extends ProdutoEvent {
  final String id;

  const GetProdutosEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}

class GetAllProdutosEvent extends ProdutoEvent {
  @override
  List<Object?> get props => [];
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
  
  CreateProdutoEvent({
    required this.produto,
  });
  
  @override
  List<Object?> get props => [produto];


}
