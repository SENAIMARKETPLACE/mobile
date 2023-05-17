// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Access extends Equatable {
  final String nome;
  final String nomeProprietario;
  final String foto;
  final String id;

  const Access({
    required this.nome,
    required this.nomeProprietario,
    required this.foto,
    required this.id,
  });

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      nome: json['nome_fantasia'] ?? '',
      nomeProprietario: json['nome_proprietario'] ?? '',
      foto: json['url_logo'] ?? '',
      id: json['id'].toString()
    );
  }

  factory Access.instance() {
    return const Access(
      nome: '',
      nomeProprietario: '',
      foto: '',
      id: ''
    );
  }

  @override
  List<Object?> get props => [
        nome,
        nomeProprietario,
        foto,
        id,
      ];
}
