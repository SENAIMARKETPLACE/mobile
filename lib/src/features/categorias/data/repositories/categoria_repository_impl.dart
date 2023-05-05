// import 'package:cep/src/core/error/exceptions.dart';
// import 'package:cep/src/features/categorias/data/datasources/categorias_remote_data_source.dart';
// import 'package:cep/src/features/categorias/data/models/sub_categoria_model.dart';
// import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
// import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
// import 'package:cep/src/core/error/failure.dart';
// import 'package:cep/src/features/categorias/domain/repositories/categoria_repository.dart';
// import 'package:dartz/dartz.dart';

// class CategoriaRepositoryImpl implements CategoriaRepository {
//   final ICategoriaRemoteDataSource categoriaRemoteDataSource;

//   CategoriaRepositoryImpl(this.categoriaRemoteDataSource);

//   @override
//   Future<Either<Failure, List<Categoria>>> getAllCategorias() async {
//     try {
//       final listCategoria = await categoriaRemoteDataSource.getAllCategorias();

//       return Right(listCategoria);
//     } on ServerException {
//       return const Left(ServerFailure());
//     }
//   }
  
//   @override
//   Future<Either<Failure, List<SubCategoria>>> getAllSubCategorias({required String id}) async {
//     try {
//       final List<SubCategoriaModel> list = await categoriaRemoteDataSource.getAllSubCategorias(id: id);
    
//     return  Right(list);
//     } catch () {
      
//     }
//   }

  
// }
