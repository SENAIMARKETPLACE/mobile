// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Endereco extends Equatable {
  final String id;
  final String? idUsuario;
  final String? idEmpresa;
  final String cep;
  final String numero;
  final String estado;
  final String bairro;
  final String cidade;
  final String logradouro;
  final String? complemento;

  const Endereco({
    this.idUsuario,
    this.idEmpresa,
    required this.id,
    required this.cep,
    required this.numero,
    required this.estado,
    required this.bairro,
    required this.cidade,
    required this.logradouro,
    this.complemento,
  });

  factory Endereco.empty() {
    return const Endereco(
        id: '',
        idUsuario: '',
        idEmpresa: '',
        cep: '',
        numero: '',
        estado: '',
        bairro: '',
        cidade: '',
        logradouro: '');
  }

  @override
  List<Object?> get props => [
        id,
        idUsuario,
        idEmpresa,
        cep,
        numero,
        estado,
        bairro,
        cidade,
        logradouro,
        complemento,
      ];
}





// CREATE TABLE enderecos(
// id INTEGER PRIMARY KEY AUTO_INCREMENT,
// usuario_id INTEGER,
// empresa_id INTEGER, 
// cep char(8) NOT NULL,
// logradouro VARCHAR(100) NOT NULL,
// numero VARCHAR(6) NOT NULL,
// estado CHAR(2) NOT NULL,
// bairro VARCHAR(40)NOT NULL,
// cidade VARCHAR(30) NOT NULL,
// complemento VARCHAR(50)
// );