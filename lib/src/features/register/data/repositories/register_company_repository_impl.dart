// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/register/data/datasources/address_remote_data_source.dart';
import 'package:cep/src/features/register/data/datasources/company_remote_data_source.dart';
import 'package:cep/src/features/register/data/models/company_model.dart';
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:cep/src/features/register/domain/repositories/register_company_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterCompanyRepositoryImpl implements RegisterCompanyRepository {
  final IAddressRemoteDataSource addressRemoteDataSource;
  final ICompanyRemoteDataSource companyRemoteDataSource;

  RegisterCompanyRepositoryImpl({
    required this.addressRemoteDataSource,
    required this.companyRemoteDataSource,
  });

  @override
  Future<Either<Failure, Address>> getCep(String cep) async {
    try {
      final address = await addressRemoteDataSource.getAddress(cep: cep);
      return Right(address);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> registerCompany(Company company) async {
    try {
      await companyRemoteDataSource.register(
          company: CompanyModel.fromEntity(company));

      return const Right(unit);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
