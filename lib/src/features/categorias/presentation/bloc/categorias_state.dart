// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';

enum CategoriaStatus { initial, loading, success, error }

class CategoriaState extends Equatable {
  final CategoriaStatus status;
  final String message;
  final bool isSearch;
  final List<Categoria> categorias;
  final List<Categoria> categoriasFiltro;
  final List<SubCategoria> subCategorias;
  final List<SubCategoria> subCategoriasFiltro;

  const CategoriaState({
    required this.status,
    required this.message,
    required this.isSearch,
    required this.categorias,
    required this.categoriasFiltro,
    required this.subCategorias,
    required this.subCategoriasFiltro,
  });

  factory CategoriaState.initial() => const CategoriaState(
        status: CategoriaStatus.initial,
        message: '',
        isSearch: false,
        categorias: [],
        subCategorias: [],
        categoriasFiltro: [],
        subCategoriasFiltro: []
      );

  

  @override
  List<Object> get props {
    return [
      status,
      message,
      isSearch,
      categorias,
      categoriasFiltro,
      subCategorias,
      subCategoriasFiltro,
    ];
  }

  CategoriaState copyWith({
    CategoriaStatus? status,
    String? message,
    bool? isSearch,
    List<Categoria>? categorias,
    List<Categoria>? categoriasFiltro,
    List<SubCategoria>? subCategorias,
    List<SubCategoria>? subCategoriasFiltro,
  }) {
    return CategoriaState(
      status: status ?? this.status,
      message: message ?? this.message,
      isSearch: isSearch ?? this.isSearch,
      categorias: categorias ?? this.categorias,
      categoriasFiltro: categoriasFiltro ?? this.categoriasFiltro,
      subCategorias: subCategorias ?? this.subCategorias,
      subCategoriasFiltro: subCategoriasFiltro ?? this.subCategoriasFiltro,
    );
  }
}
