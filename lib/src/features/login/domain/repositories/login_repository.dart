import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/cadastro/domain/entities/company.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, Unit>> logar(Login credenciais);
}
