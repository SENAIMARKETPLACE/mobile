import 'dart:async';

import 'package:cep/src/core/params/params.dart';

import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProdutoBloc extends Bloc<ProdutoEvent, ProdutoState> {
  final UseCase<List<Produto>, Params> getProdutos;

  ProdutoBloc({
    required this.getProdutos,
  }) : super(
          ProdutoState.initial(),
        ) {
    on<GetProdutosEvent>(_getAllProdutos);
    on<FiltroProdutoEvent>(_filtroProdutos);
  }

  Future<void> _getAllProdutos(
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
        ),
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
              (subCategoria) => subCategoria.nome.toLowerCase().contains(
                    event.value.toLowerCase(),
                  ),
            )
            .toList(),
      ),
    );
  }
}
