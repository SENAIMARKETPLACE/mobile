import 'package:cep/src/core/params/params_global.dart';
import 'package:dartz/dartz.dart';

import 'package:cep/src/core/error/failure.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/domain/repositories/produto_repository.dart';

class GetAllProdutosSubCategoriaUseCase
    implements UseCase<List<Produto>, ParamsGlobal> {
  final ProdutoRepository repository;

  GetAllProdutosSubCategoriaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Produto>>> call(ParamsGlobal params) async {
    return await repository.getAllProdutosSubCategoria(
      idEmpresa: params.idEmpresa,
      idSubCategoria: params.idSubCategoria,
    );
  }
}
