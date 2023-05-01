import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/cadastro/domain/entities/address.dart';
import 'package:cep/src/features/cadastro/domain/repositories/register_company_repository.dart';
import 'package:dartz/dartz.dart';

class GetCepUseCase implements UseCase<Address, String> {
  final RegisterCompanyRepository signUpRepository;

  GetCepUseCase(this.signUpRepository);

  @override
  Future<Either<Failure, Address>> call(String cep) async {
    return await signUpRepository.getCep(cep);
  }
}
