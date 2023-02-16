import 'package:dartz/dartz.dart';
import 'package:sollaris_teste/src/core/error/failure.dart';
import 'package:sollaris_teste/src/features/login/domain/entities/user.dart';
import 'package:sollaris_teste/src/features/login/domain/repositories/user_repository.dart';

abstract class CadastrarUsuarioUseCase {
  Future<Either<Failure, User>> call(User user);
}

class CadastrarUsuarioImpl extends CadastrarUsuarioUseCase {

  final UserRepository userRepository;

  CadastrarUsuarioImpl(this.userRepository);

  @override
  Future<Either<Failure, User>> call(User user) async {
    return await userRepository.cadastrarUsuario(user);
  }
  
}