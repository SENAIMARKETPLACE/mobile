import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/cadastro/domain/entities/address.dart';
import 'package:cep/src/features/cadastro/domain/entities/company.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterCompanyRepository {
  Future<Either<Failure, Unit>> registerCompany(Company usuario);
  Future<Either<Failure, Address>> getCep(String cep);
}
