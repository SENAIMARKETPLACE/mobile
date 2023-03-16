import 'package:sollaris_teste/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sollaris_teste/src/core/use_case/use_case.dart';
import 'package:sollaris_teste/src/features/signup/domain/entities/usuario.dart';
import 'package:sollaris_teste/src/features/signup/domain/repositories/signup_repository.dart';

class SignUpUseCase implements UseCase<Unit, Usuario> {
  final SignUpRepository signUpRepository;

  SignUpUseCase({required this.signUpRepository});

  @override
  Future<Either<Failure, Unit>> call(Usuario usuario) async {
    return await signUpRepository.signUp(usuario);
  }
}
