import 'package:equatable/equatable.dart';

abstract class CategoriaEvent extends Equatable {
  const CategoriaEvent();
}

class GetCategoriasEvent extends CategoriaEvent {
  @override
  List<Object?> get props => [];
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
