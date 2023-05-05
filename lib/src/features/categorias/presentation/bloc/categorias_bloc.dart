import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  final UseCase<List<Categoria>, NoParams> getCategorias;
  final UseCase<List<SubCategoria>, String> getSubCategorias;

  CategoriaBloc({
    required this.getCategorias,
    required this.getSubCategorias,
  }) : super(
          CategoriaState.initial(),
        ) {
    on<GetCategoriasEvent>(_getAllCategorias);
    on<GetSubCategoriasEvent>(_getAllSubCategorias);
  }

  Future<void> _getAllCategorias(
    GetCategoriasEvent event,
    Emitter<CategoriaState> emit,
  ) async {
    emit(state.copyWith(status: CategoriaStatus.loading));

    final getResult = await getCategorias(NoParams());

    getResult.fold(
      (failure) => emit(
        state.copyWith(
          status: CategoriaStatus.error,
          message: failure.message,
        ),
      ),
      (categorias) => emit(
        state.copyWith(
          status: CategoriaStatus.success,
          categorias: categorias,
        ),
      ),
    );
  }

  Future<void> _getAllSubCategorias(
    GetSubCategoriasEvent event,
    Emitter<CategoriaState> emit,
  ) async {
    emit(state.copyWith(status: CategoriaStatus.loading));

    final getResult = await getSubCategorias(event.id);

    getResult.fold(
      (failure) => emit(
        state.copyWith(
          status: CategoriaStatus.error,
          message: failure.message,
        ),
      ),
      (subCategorias) => emit(
        state.copyWith(
          status: CategoriaStatus.success,
          subCategorias: subCategorias,
        ),
      ),
    );
  }
}
