import 'package:sollaris_teste/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sollaris_teste/src/core/params/params.dart';
import 'package:sollaris_teste/src/core/use_case/use_case.dart';
import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';
import 'package:sollaris_teste/src/features/signup/domain/repositories/signup_repository.dart';

class GetCepUseCase implements UseCase<Endereco, Params> {
  final SignUpRepository signUpRepository;

  GetCepUseCase(this.signUpRepository);

  @override
  Future<Either<Failure, Endereco>> call(Params params) async {
    return await signUpRepository.getCep(params.cep);
  }
}
