import 'package:dartz/dartz.dart';
import 'package:sollaris_teste/src/core/error/failure.dart';
import 'package:sollaris_teste/src/features/login/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> cadastrarUsuario(User user);
}