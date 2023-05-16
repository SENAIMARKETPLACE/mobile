// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Detalhe extends Equatable {
  final String id;
  final String tamanho;
  final String peso;
  final String cor;
  final String quantidade;

  const Detalhe({
    required this.id,
    required this.tamanho,
    required this.peso,
    required this.cor,
    required this.quantidade,
  });

  factory Detalhe.instance() {
    return const Detalhe(
      id: '',
      tamanho: '',
      peso: '',
      cor: '',
      quantidade: '',
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      tamanho,
      peso,
      cor,
      quantidade,
    ];
  }
}
