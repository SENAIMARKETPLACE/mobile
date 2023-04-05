import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:cep/src/features/register/domain/repositories/register_company_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterCompanyUseCase implements UseCase<Unit, Company> {
  final RegisterCompanyRepository registerRepository;

  RegisterCompanyUseCase({required this.registerRepository});

  @override
  Future<Either<Failure, Unit>> call(Company usuario) async {
    return await registerRepository.registerCompany(usuario);
  }
}
