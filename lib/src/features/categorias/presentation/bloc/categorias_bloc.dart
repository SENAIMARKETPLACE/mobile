// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:cep/src/core/params/params.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  final UseCase<List<Categoria>, NoParams> getCategorias;
  final UseCase<List<SubCategoria>, NoParams> getAllCategorias;
  final UseCase<List<SubCategoria>, Params> getSubCategorias;

  CategoriaBloc({
    required this.getCategorias,
    required this.getAllCategorias,
    required this.getSubCategorias,
  }) : super(
          CategoriaState.initial(),
        ) {
    on<GetCategoriasEvent>(_getCategorias);
    on<GetAllSubCategoriasEvent>(_getAllCategorias);
    on<GetSubCategoriasEvent>(_getSubCategorias);
    on<FiltroCategoriaEvent>(_getCategoriasFiltro);
    on<FiltroSubCategoriaEvent>(_getSubCategoriasFiltro);
  }

  Future<void> _getCategorias(
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
          categoriasFiltro: categorias,
        ),
      ),
    );
  }

  Future<void> _getSubCategorias(
    GetSubCategoriasEvent event,
    Emitter<CategoriaState> emit,
  ) async {
    emit(state.copyWith(status: CategoriaStatus.loading));

    final getResult = await getSubCategorias(Params(params: event.id));

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
            subCategoriasFiltro: subCategorias),
      ),
    );
  }

  Future<void> _getCategoriasFiltro(
    FiltroCategoriaEvent event,
    Emitter<CategoriaState> emit,
  ) async {
    emit(
      state.copyWith(
        categoriasFiltro: state.categorias
            .where(
              (categoria) => categoria.nome.toLowerCase().contains(
                    event.value.toLowerCase(),
                  ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _getSubCategoriasFiltro(
    FiltroSubCategoriaEvent event,
    Emitter<CategoriaState> emit,
  ) async {
    emit(
      state.copyWith(
        subCategoriasFiltro: state.subCategorias
            .where(
              (subCategoria) => subCategoria.nome.toLowerCase().contains(
                    event.value.toLowerCase(),
                  ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _getAllCategorias(
    GetAllSubCategoriasEvent event,
    Emitter<CategoriaState> emit,
  ) async {
    emit(state.copyWith(status: CategoriaStatus.loading));

    final getResult = await getAllCategorias(NoParams());

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
          subCategoriasFiltro: subCategorias,
        ),
      ),
    );
  }
}
