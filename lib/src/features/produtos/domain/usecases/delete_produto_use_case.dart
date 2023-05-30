import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/params/params.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/repositories/produto_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteProdutoUseCase implements UseCase<Unit, Params> {
  final ProdutoRepository repository;

  DeleteProdutoUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(Params id) async {
    return await repository.deleteProduto(id: id.params);
  }
}