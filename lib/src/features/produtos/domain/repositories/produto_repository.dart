import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:dartz/dartz.dart';

abstract class ProdutoRepository {
  Future<Either<Failure, List<Produto>>> getAllProdutosSubCategoria({
    required String idEmpresa,
    required String idSubCategoria,
  });
  Future<Either<Failure, List<Produto>>> getAllProdutosCompany({
    required String idEmpresa,
  });
  Future<Either<Failure, Produto>> getProduct({
    required String idProduct,
  });
  Future<Either<Failure, Unit>> createProduto({
    required Produto produto,
  });
  Future<Either<Failure, Unit>> deleteProduto({
    required String id,
  });
  Future<Either<Failure, Unit>> updateProduto({
    required Produto produto,
  });
}
