// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';

class Usuario extends Equatable {
  final String id;
  final String name;
  final String cpf;
  final String dtNasc;
  final String email;
  final String senha;
  final String telefone;
  final String genero;
  final String foto;
  final List<String> grupoInteresses;
  final List<Endereco> listEndereco;
  // final Endereco? endereco; ----> Parametro que vai ser usada na API

  const Usuario({
    // this.endereco,
    required this.id,
    required this.name,
    required this.cpf,
    required this.dtNasc,
    required this.email,
    required this.senha,
    required this.telefone,
    required this.genero,
    required this.foto,
    required this.grupoInteresses,
    required this.listEndereco,
  });

  factory Usuario.empty() {
    return const Usuario(
      id: '',
      name: '',
      cpf: '',
      dtNasc: '',
      email: '',
      senha: '',
      telefone: '',
      genero: '',
      foto: '',
      grupoInteresses: [],
      listEndereco: [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        cpf,
        dtNasc,
        email,
        senha,
        telefone,
        genero,
        foto,
        grupoInteresses,
        listEndereco,
      ];
}
