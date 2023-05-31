// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/core/params/params.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';

class ProdutoBloc extends Bloc<ProdutoEvent, ProdutoState> {
  final UseCase<List<Produto>, Params> getProdutos;
  final UseCase<List<Produto>, NoParams> getAllProdutos;
  final UseCase<Unit, Produto> createProduto;

  ProdutoBloc({
    required this.getProdutos,
    required this.getAllProdutos,
    required this.createProduto,
  }) : super(
          ProdutoState.initial(),
        ) {
    on<GetProdutosEvent>(_getProdutos);
    on<GetAllProdutosEvent>(_getAllProdutos);
    on<FiltroProdutoEvent>(_filtroProdutos);
    on<CreateProdutoEvent>(_createProduto);
  }

  Future<void> _getProdutos(
    GetProdutosEvent event,
    Emitter<ProdutoState> emit,
  ) async {
    emit(state.copyWith(status: ProdutoStatus.loading));

    final getResult = await getProdutos(
      Params(
        params: event.id,
      ),
    );

    getResult.fold(
      (failure) => emit(
        state.copyWith(
          status: ProdutoStatus.error,
          message: failure.message,
        ),
      ),
      (produtos) => emit(
        state.copyWith(
            status: ProdutoStatus.success,
            produtos: produtos,
            produtosFiltro: produtos),
      ),
    );
  }

  Future<void> _filtroProdutos(
    FiltroProdutoEvent event,
    Emitter<ProdutoState> emit,
  ) async {
    emit(
      state.copyWith(
        produtosFiltro: state.produtosFiltro
            .where(
              (produto) => produto.nome.toLowerCase().contains(
                    event.value.toLowerCase(),
                  ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _getAllProdutos(
    GetAllProdutosEvent event,
    Emitter<ProdutoState> emit,
  ) async {
    emit(state.copyWith(status: ProdutoStatus.loading));

    final getResult = await getAllProdutos(NoParams());

    getResult.fold(
      (failure) => emit(
        state.copyWith(
          status: ProdutoStatus.error,
          message: failure.message,
        ),
      ),
      (produtos) => emit(
        state.copyWith(
          status: ProdutoStatus.success,
          produtos: produtos,
          produtosFiltro: produtos,
        ),
      ),
    );
  }

  Future<void> _createProduto(
    CreateProdutoEvent event,
    Emitter<ProdutoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProdutoStatus.loading,
      ),
    );

    final result = await createProduto(event.produto);

    result.fold(
      (failure) {
        state.copyWith(
          status: ProdutoStatus.error,
          message: 'Erro ao cadastrar produto, tente novamente!',
        );
      },
      (_) => state.copyWith(
        status: ProdutoStatus.success,
        message: 'Produto cadastrado com sucesso!',
      ),
    );
  }
}
