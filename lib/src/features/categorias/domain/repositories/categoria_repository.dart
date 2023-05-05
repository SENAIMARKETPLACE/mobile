import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriaRepository {
  // Future<Either<Failure, Categoria>> getCategoria({required String id});
  // Future<Either<Failure, List<SubCategoria>>> getSubCategorias({required id});
  Future<Either<Failure, List<Categoria>>> getAllCategorias();
  Future<Either<Failure, List<SubCategoria>>> getAllSubCategorias({required String id});
}
