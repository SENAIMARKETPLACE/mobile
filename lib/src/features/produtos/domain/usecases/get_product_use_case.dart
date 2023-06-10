import 'package:cep/src/core/params/params.dart';
import 'package:dartz/dartz.dart';

import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/domain/repositories/produto_repository.dart';

class GetProductUseCase implements UseCase<Produto, Params> {
  final ProdutoRepository repository;

  GetProductUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Produto>> call(Params params) async {
    return await repository.getProduct(idProduct: params.params);
  }
}
