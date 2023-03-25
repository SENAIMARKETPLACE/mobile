// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  
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

  const Address({
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

  factory Address.empty() {
    return const Address(
      id: '',
      idUsuario: '',
      idEmpresa: '',
      cep: '',
      numero: '',
      estado: '',
      bairro: '',
      cidade: '',
      logradouro: '',
    );
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
