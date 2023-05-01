// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:cep/src/features/login/domain/repositories/login_repository.dart';

class LogarUseCase implements UseCase<Unit, Login> {
  final LoginRepository loginRepository;

  LogarUseCase({
    required this.loginRepository,
  });


  @override
  Future<Either<Failure, Unit>> call(Login login) async {
    return await loginRepository.logar(login);
  }
}
