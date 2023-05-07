// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class CategoriaEvent extends Equatable {
  const CategoriaEvent();
}

class GetCategoriasEvent extends CategoriaEvent {
  @override
  List<Object?> get props => [];
}

class FiltroCategoriaEvent extends CategoriaEvent {
  final String value;

  const FiltroCategoriaEvent({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

class FiltroSubCategoriaEvent extends CategoriaEvent {
  final String value;

  const FiltroSubCategoriaEvent({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

class GetSubCategoriasEvent extends CategoriaEvent {
  final String id;

  const GetSubCategoriasEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class ExibSearchEvent extends CategoriaEvent {
  final bool isSearch;

  const ExibSearchEvent({
    required this.isSearch,
  });

  @override
  List<Object?> get props => [isSearch];
}
