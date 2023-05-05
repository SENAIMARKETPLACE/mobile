// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;

import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/network/network_info.dart';
import 'package:cep/src/features/categorias/data/models/categoria_model.dart';
import 'package:cep/src/features/categorias/data/models/sub_categoria_model.dart';

abstract class ICategoriaRemoteDataSource {
  Future<List<CategoriaModel>> getAllCategorias();
  Future<List<SubCategoriaModel>> getAllSubCategorias({required String id});
}

class CategoriaRemoteDataSourceImpl implements ICategoriaRemoteDataSource {
  final http.Client client;
  final NetworkInfo network;

  CategoriaRemoteDataSourceImpl({
    required this.client,
    required this.network,
  });

  @override
  Future<List<CategoriaModel>> getAllCategorias() async {
    var url = 'http://localhost:8100/api/categories';
    final response = await client.get(Uri.parse(url));
    final isConnected = await network.isConnected;

    if (isConnected) {
      if (response.statusCode == 200) {
        final List<CategoriaModel> list = [];
        list.addAll((response.body as List)
            .map((categoria) => CategoriaModel.fromJson(categoria))
            .toList());

        return Future.value(list);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }

  @override
  Future<List<SubCategoriaModel>> getAllSubCategorias(
      {required String id}) async {
    var url = '';
    final isConnected = await network.isConnected;
    final response = await client.get(Uri.parse(url));

    if (isConnected) {
      if (response.statusCode == 200) {
        final List<SubCategoriaModel> list = [];
        list.addAll((response.body as List)
            .map((subcategoria) => SubCategoriaModel.fromJson(subcategoria))
            .toList());

        return Future.value(list);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }
}
