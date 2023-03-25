// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/register/data/datasources/address_remote_data_source.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/repositories/register_company_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterCompanyRepositoryImpl implements RegisterCompanyRepository {
  final IAddressRemoteDataSource remoteDataSource;

  RegisterCompanyRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Address>> getCep(String cep) async {
    try {
      final address = await remoteDataSource.getAddress(cep: cep);
      return Right(address);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> registerCompany(Company usuario) {
    throw UnimplementedError();
  }
}
