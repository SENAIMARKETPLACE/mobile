
import 'package:equatable/equatable.dart';
import 'package:sollaris_teste/src/core/domain/entity/endereco.dart';

class User extends Equatable{
  final String nome;
  final String cpf;
  final String dtNascimento;
  final String email;
  final String senha;
  final String telefone;
  final List<IEndereco> endereco;
  final String id;

  User(this.nome, this.cpf, this.dtNascimento, this.email, this.senha, this.telefone, this.endereco, this.id);
  
  @override
  List<Object?> get props => [
    nome,
    cpf,
    dtNascimento,
    email,
    senha,
    telefone,
    endereco,
    id,
  ];



  
  
}