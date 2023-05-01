// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/features/login/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/login/data/datasources/login_remote_data_source.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:cep/src/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ILoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> logar(Login credenciais) async {
    try {
      await loginRemoteDataSource.logar(
          login: LoginModel.fromEntity(credenciais));

      return const Right(unit);
    } on NotFoundCompany {
      return const Left(NotFoundFailure());
    }
  }
}
