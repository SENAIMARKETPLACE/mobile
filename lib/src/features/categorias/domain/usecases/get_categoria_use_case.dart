// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/params/params.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/repositories/categoria_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoriaUseCase implements UseCase<Categoria, Params> {
  final CategoriaRepository repository;

  GetCategoriaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Categoria>> call(Params params) async {
    return await repository.getCategoria(id: params.params);
  }
}
