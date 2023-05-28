// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';

enum HomeStatus { initial, success, loading, error }

class HomeState extends Equatable {
  final List<Categoria> listCategory;
  final List<SubCategoria> listSubCategory;
  final List<Produto> listProduct;
  final String title;
  final String message;
  final HomeStatus status;

  const HomeState({
    required this.listCategory,
    required this.listSubCategory,
    required this.listProduct,
    required this.title,
    required this.message,
    required this.status,
  });

  factory HomeState.initial() => const HomeState(
        status: HomeStatus.initial,
        listCategory: [],
        listSubCategory: [],
        listProduct: [],
        title: '',
        message: '',

      );

  @override
  List<Object> get props {
    return [
      listCategory,
      listSubCategory,
      listProduct,
      title,
      message,
    ];
  }

  HomeState copyWith({
    List<Categoria>? listCategory,
    List<SubCategoria>? listSubCategory,
    List<Produto>? listProduct,
    String? title,
    String? message,
    HomeStatus? status,
  }) {
    return HomeState(
      listCategory: listCategory ?? this.listCategory,
      listSubCategory: listSubCategory ?? this.listSubCategory,
      listProduct: listProduct ?? this.listProduct,
      title: title ?? this.title,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
