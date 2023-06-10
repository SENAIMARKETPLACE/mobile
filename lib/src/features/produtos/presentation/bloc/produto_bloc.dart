// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/core/params/params.dart';
import 'package:cep/src/core/params/params_global.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';

class ProdutoBloc extends Bloc<ProdutoEvent, ProdutoState> {
  final UseCase<List<Produto>, ParamsGlobal> getProdutos;
  final UseCase<List<Produto>, ParamsGlobal> getAllProdutos;
  final UseCase<Produto, Params> getProduct;
  final UseCase<Unit, Produto> createProduto;
  final UseCase<Unit, Produto> updateProduto;

  ProdutoBloc({
    required this.getProdutos,
    required this.getAllProdutos,
    required this.getProduct,
    required this.createProduto,
    required this.updateProduto,
  }) : super(
          ProdutoState.initial(),
        ) {
    on<GetProdutosEvent>(_getProdutos);
    on<GetAllProdutosEvent>(_getAllProdutos);
    on<FiltroProdutoEvent>(_filtroProdutos);
    on<CreateProdutoEvent>(_createProduto);
    on<GetProductEvent>(_getProduct);
    on<UpdateProdutoEvent>(_updateProduct);
  }

  Future<void> _getProdutos(
    GetProdutosEvent event,
    Emitter<ProdutoState> emit,
  ) async {
    emit(state.copyWith(status: ProdutoStatus.loading));

    final getResult = await getProdutos(
      ParamsGlobal(
        idSubCategoria: event.idSubCategoria,
        idEmpresa: event.idEmpresa,
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
        produtosFiltro: state.produtos
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

    final getResult = await getAllProdutos(
        ParamsGlobal(idSubCategoria: '', idEmpresa: event.idEmpresa));

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
    final result = await createProduto(event.produto);
    final pref = await PreferencesActions.load();

    result.fold(
      (failure) {
        state.copyWith(
          status: ProdutoStatus.error,
          message: 'Erro ao cadastrar produto, tente novamente!',
        );
      },
      (_) => add(GetAllProdutosEvent(idEmpresa: pref.id)),
    );
  }

  Future<void> _getProduct(
    GetProductEvent event,
    Emitter<ProdutoState> emit,
  ) async {
    if (event.id.isEmpty) {
      emit(state.copyWith(status: ProdutoStatus.success));
    } else {
      emit(state.copyWith(
        status: ProdutoStatus.loading,
      ));

      final result = await getProduct(Params(params: event.id));

      result.fold(
        (failure) {
          state.copyWith(
            status: ProdutoStatus.error,
            message: 'Erro ao cadastrar produto, tente novamente!',
          );
        },
        (produto) => emit(state.copyWith(
          status: ProdutoStatus.success,
          product: produto,
        )),
      );
    }
  }

  Future<void> _updateProduct(
    UpdateProdutoEvent event,
    Emitter<ProdutoState> emit,
  ) async {
    final result = await updateProduto(event.produto);
    final pref = await PreferencesActions.load();

    result.fold(
      (failure) {
        state.copyWith(
          status: ProdutoStatus.error,
          message: 'Erro ao cadastrar produto, tente novamente!',
        );
      },
      (_) => add(GetAllProdutosEvent(idEmpresa: pref.id)),
    );
  }
}
