import 'package:equatable/equatable.dart';

class Address extends Equatable {
  
  final String cep;
  final String logradouro;
  final String numero;
  final String estado;
  final String bairro;
  final String cidade;
  final String? complemento;

  const Address({
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
        cep,
        numero,
        estado,
        bairro,
        cidade,
        logradouro,
        complemento,
      ];
}
