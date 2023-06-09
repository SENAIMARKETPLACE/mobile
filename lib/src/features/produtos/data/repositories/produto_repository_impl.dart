// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/produtos/data/models/produto_model.dart';
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
  Future<Either<Failure, List<Produto>>> getAllProdutosSubCategoria({
    required String idEmpresa,
    required String idSubCategoria,
  }) async {
    try {
      final listProduto =
          await produtoRemoteDataSource.getAllProdutosSubCategoria(
        idEmpresa: idEmpresa,
        idSubCategoria: idSubCategoria,
      );

      return Right(listProduto);
    } on ServerException {
      return const Left(ServerFailure());
    } on ConnectionOffline {
      return const Left(ConnectionOfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Produto>>> getAllProdutosCompany(
      {required String idEmpresa}) async {
    try {
      final listProduto = await produtoRemoteDataSource.getAllProdutosCompany(
          idEmpresa: idEmpresa);

      return Right(listProduto);
    } on ServerException {
      return const Left(ServerFailure());
    } on ConnectionOffline {
      return const Left(ConnectionOfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createProduto(
      {required Produto produto}) async {
    try {
      final product = ProdutoModel.fromEntity(produto);
      await produtoRemoteDataSource.createProduto(produto: product);

      return const Right(unit);
    } on ServerException {
      return const Left(ServerFailure());
    } on ConnectionOffline {
      return const Left(ConnectionOfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduto({required String id}) async {
    try {
      await produtoRemoteDataSource.deleteProduto(id: id);

      return const Right(unit);
    } on ServerException {
      return const Left(ServerFailure());
    } on ConnectionOffline {
      return const Left(ConnectionOfflineFailure());
    }
  }
}
