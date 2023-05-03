import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/repositories/categoria_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCategoriasUseCase implements UseCase<List<Categoria>, NoParams> {
  final CategoriaRepository repository;

  GetAllCategoriasUseCase(this.repository);

  @override
  Future<Either<Failure, List<Categoria>>> call(NoParams params) async {
    return await repository.getAllCategorias();
  }
}
