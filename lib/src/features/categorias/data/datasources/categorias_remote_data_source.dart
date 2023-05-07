// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cep/src/core/network/base_data_source_info.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
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
    var url = '${baseUrl}api/categories';
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final isConnected = await network.isConnected;
    final list = <CategoriaModel>[];

    if (isConnected) {
      if (response.statusCode == 200) {
        final json = jsonDecode(const Utf8Decoder().convert(response.bodyBytes))
            as Map<String, dynamic>;

        list.addAll((json['content'] as List).map(
          (categoria) {
            return CategoriaModel.fromMap(categoria as Map<String, dynamic>);
          },
        ));

        return Future.value(list);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }

  @override
  Future<List<SubCategoriaModel>> getAllSubCategorias(
      {required String id}) async {
    var url = '${baseUrl}api/sub_categories/categories/$id';
    final isConnected = await network.isConnected;
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final List<SubCategoriaModel> list = [];

    if (isConnected) {
      if (response.statusCode == 200) {
        final json = jsonDecode(const Utf8Decoder().convert(response.bodyBytes))
            as Map<String, dynamic>;

        list.addAll((json['content'] as List).map(
          (categoria) {
            return SubCategoriaModel.fromMap(categoria as Map<String, dynamic>);
          },
        ));

        return Future.value(list);
      } else if (response.statusCode == 404) {
        return Future.value(list);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }
}
