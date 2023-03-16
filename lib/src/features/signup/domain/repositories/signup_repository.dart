import 'package:dartz/dartz.dart';
import 'package:sollaris_teste/src/core/error/failure.dart';
import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';
import 'package:sollaris_teste/src/features/signup/domain/entities/usuario.dart';

abstract class SignUpRepository {
  Future<Either<Failure, Unit>> signUp(Usuario usuario);
  Future<Either<Failure, Endereco>> getCep(String cep);
}
