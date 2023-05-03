// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:equatable/equatable.dart';

class Categoria extends Equatable {
  final String id;
  final String nome;
  final List<SubCategoria> subCategorias;

  const Categoria({
    required this.id,
    required this.nome,
    required this.subCategorias,
  });

  factory Categoria.instance() {
    return const Categoria(
      id: '',
      nome: '',
      subCategorias: [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        subCategorias,
      ];
}
