import 'package:equatable/equatable.dart';

class SubCategoria extends Equatable {
  final String id;
  final String nome;

  const SubCategoria({
    required this.id,
    required this.nome,
  });

  factory SubCategoria.instance() {
    return const SubCategoria(
      id: '',
      nome: '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
      ];
}
