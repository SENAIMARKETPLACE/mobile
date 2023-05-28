// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/params/params.dart';
import 'package:dartz/dartz.dart';

import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/domain/repositories/produto_repository.dart';

class GetProdutosUseCase implements UseCase<List<Produto>, Params> {
  final ProdutoRepository repository;

  GetProdutosUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Produto>>> call(Params params) async {
    return await repository.getProdutos(id: params.params);
  }
}
