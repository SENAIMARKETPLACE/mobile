import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/categorias/domain/repositories/categoria_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllSubCategoriasUseCase implements UseCase<List<SubCategoria>, NoParams> {
  final CategoriaRepository repository;

  GetAllSubCategoriasUseCase({required this.repository});

  @override
  Future<Either<Failure, List<SubCategoria>>> call(NoParams params) async {
    return await repository.getAllSubCategorias();
  }
}
