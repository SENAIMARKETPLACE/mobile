import 'package:cep/src/features/categorias/data/models/categoria_model.dart';
import 'package:cep/src/features/categorias/data/models/sub_categoria_model.dart';

abstract class ICategoriaRemoteDataSource {
  Future<CategoriaModel> getCategoria({required String id});
  Future<List<CategoriaModel>> getAllCategorias();
  Future<List<SubCategoriaModel>> getSubCategorias({required id});
  Future<List<SubCategoriaModel>> getAllSubCategorias();
}

class CategoriaRemoteDataSourceImpl implements ICategoriaRemoteDataSource {
  @override
  Future<List<CategoriaModel>> getAllCategorias() {
    // TODO: implement getAllCategorias
    throw UnimplementedError();
  }

  @override
  Future<List<SubCategoriaModel>> getAllSubCategorias() {
    // TODO: implement getAllSubCategorias
    throw UnimplementedError();
  }

  @override
  Future<CategoriaModel> getCategoria({required String id}) {
    // TODO: implement getCategoria
    throw UnimplementedError();
  }

  @override
  Future<List<SubCategoriaModel>> getSubCategorias({required id}) {
    // TODO: implement getSubCategorias
    throw UnimplementedError();
  }
  
}
