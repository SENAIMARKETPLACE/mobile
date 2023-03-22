// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:sollaris_teste/src/core/error/exceptions.dart';

import 'package:sollaris_teste/src/core/error/failure.dart';
import 'package:sollaris_teste/src/features/signup/data/datasources/endereco_remote_data_source.dart';
import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';
import 'package:sollaris_teste/src/features/signup/domain/entities/usuario.dart';
import 'package:sollaris_teste/src/features/signup/domain/repositories/signup_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final EnderecoRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Endereco>> getCep(String cep) async {
    try {
      final address = await remoteDataSource.getEndereco(cep: cep);
      return Right(address);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(Usuario usuario) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
