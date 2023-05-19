// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cep/src/core/error/failure.dart';
// import 'package:cep/src/core/params/params.dart';
// import 'package:cep/src/core/use_case/use_case.dart';
// import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
// import 'package:cep/src/features/categorias/domain/repositories/categoria_repository.dart';
// import 'package:dartz/dartz.dart';

// class GetSubCategoriasUseCase implements UseCase<List<SubCategoria>, Params> {
//   final CategoriaRepository repository;

//   GetSubCategoriasUseCase({
//     required this.repository,
//   });

//   @override
//   Future<Either<Failure, List<SubCategoria>>> call(Params params) async {
//     return await repository.getSubCategorias(id: params.params);
//   }
// }