import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/domain/repositories/produto_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProdutoUseCase implements UseCase<Unit, Produto> {
  final ProdutoRepository repository;

  UpdateProdutoUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(Produto entity) async {
    return await repository.updateProduto(produto: entity);
  }
}
