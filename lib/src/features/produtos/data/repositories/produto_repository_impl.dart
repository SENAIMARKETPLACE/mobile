// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:dartz/dartz.dart';

import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/features/produtos/data/datasources/produto_remote_data_source.dart';
import 'package:cep/src/features/produtos/domain/repositories/produto_repository.dart';

class ProdutoRepositoryImpl implements ProdutoRepository {
  final IProdutoRemoteDataSource produtoRemoteDataSource;

  ProdutoRepositoryImpl({
    required this.produtoRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Produto>>> getAllProdutos(
      {required String id}) async {
    try {
      final listProduto = await produtoRemoteDataSource.getAllProdutos(id: id);

      return Right(listProduto);
    } on ServerException {
      return const Left(ServerFailure());
    } on ConnectionOffline {
      return const Left(ConnectionOfflineFailure());
    }
  }
}
