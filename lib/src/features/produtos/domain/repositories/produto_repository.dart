import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:dartz/dartz.dart';

abstract class ProdutoRepository {
  Future<Either<Failure, List<Produto>>> getAllProdutos({required String id});
}