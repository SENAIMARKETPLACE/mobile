// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';

class Categoria extends Equatable {
  final String id;
  final String nome;
  final List<SubCategoria>? subCategorias;
  final SubCategoria? subCategoria;

  const Categoria({
    required this.id,
    required this.nome,
    required this.subCategorias,
    this.subCategoria,
  });

  factory Categoria.instance() {
    return Categoria(
      id: '',
      nome: '',
      subCategorias: const [],
      subCategoria: SubCategoria.instance(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        subCategorias,
        subCategoria,
      ];
}
