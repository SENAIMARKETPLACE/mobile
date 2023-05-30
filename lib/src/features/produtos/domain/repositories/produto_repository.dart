import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:dartz/dartz.dart';

abstract class ProdutoRepository {
  Future<Either<Failure, List<Produto>>> getProdutos({required String id});
  Future<Either<Failure, List<Produto>>> getAllProdutos();
  Future<Either<Failure, Unit>> createProduto({required Produto produto});
  Future<Either<Failure, Unit>> deleteProduto({required String id});
}
