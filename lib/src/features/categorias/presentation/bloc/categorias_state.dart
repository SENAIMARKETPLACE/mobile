import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:equatable/equatable.dart';

enum CategoriaStatus { initial, loading, success, error }

class CategoriaState extends Equatable {
  final CategoriaStatus status;
  final String message;
  final bool isSearch;
  final List<Categoria> categorias;
  final List<SubCategoria> subCategorias;

  const CategoriaState({
    required this.status,
    required this.message,
    required this.isSearch,
    required this.categorias,
    required this.subCategorias,
  });

  factory CategoriaState.initial() => const CategoriaState(
        status: CategoriaStatus.initial,
        message: '',
        isSearch: false,
        categorias: [],
        subCategorias: [],
      );

  CategoriaState copyWith({
    CategoriaStatus? status,
    String? message,
    bool? isSearch,
    List<Categoria>? categorias,
    List<SubCategoria>? subCategorias,
  }) {
    return CategoriaState(
      status: status ?? this.status,
      message: message ?? this.message,
      isSearch: isSearch ?? this.isSearch,
      categorias: categorias ?? this.categorias,
      subCategorias: subCategorias ?? this.subCategorias,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      message,
      isSearch,
      categorias,
      subCategorias,
    ];
  }
}
