// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cep/src/core/network/base_data_source_info.dart';
import 'package:cep/src/features/produtos/data/models/produto_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/network/network_info.dart';

abstract class IProdutoRemoteDataSource {
  Future<List<ProdutoModel>> getProdutos({required String id});
  Future<List<ProdutoModel>> getAllProdutos();
  Future<Unit> createProduto({required ProdutoModel produto});
  Future<Unit> deleteProduto({required String id});
}

class ProdutoRemoteDataSourceImpl implements IProdutoRemoteDataSource {
  final http.Client client;
  final NetworkInfo network;

  ProdutoRemoteDataSourceImpl({
    required this.client,
    required this.network,
  });

  @override
  Future<List<ProdutoModel>> getProdutos({required String id}) async {
    var url = '$baseUrl/api/products/my_products/$id';
    final isConnected = await network.isConnected;
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final List<ProdutoModel> list = [];

    if (isConnected) {
      if (response.statusCode == 200) {
        final json = jsonDecode(const Utf8Decoder().convert(response.bodyBytes))
            as Map<String, dynamic>;

        list.addAll(
          (json['content'] as List).map(
            (produto) => ProdutoModel.fromMap(produto as Map<String, dynamic>),
          ),
        );

        return Future.value(list);
      } else if (response.statusCode == 404) {
        return Future.value(list);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }

  @override
  Future<List<ProdutoModel>> getAllProdutos() async {
    var url = '$baseUrl/api/products';
    final isConnected = await network.isConnected;
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final List<ProdutoModel> list = [];

    if (isConnected) {
      if (response.statusCode == 200) {
        final json = jsonDecode(const Utf8Decoder().convert(response.bodyBytes))
            as Map<String, dynamic>;

        list.addAll(
          (json['content'] as List).map(
            (produto) => ProdutoModel.fromMap(produto as Map<String, dynamic>),
          ),
        );

        return Future.value(list);
      } else if (response.statusCode == 404) {
        return Future.value(list);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }

  @override
  Future<Unit> createProduto({required ProdutoModel produto}) async {
    // var url = '${baseUrl}api/products';
    var url = 'http://172.21.144.1:8100/api/products';
    final isConnected = await network.isConnected;
    final body = produto.toJson();
    final response = await client.post(
      Uri.parse(url),
      body: body,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (isConnected) {
      if (response.statusCode == 200) {
        return Future.value(unit);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }

  @override
  Future<Unit> deleteProduto({required String id}) async {
    var url = 'minha url';
    final isConnected = await network.isConnected;
    final response = await client.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (isConnected) {
      if (response.statusCode == 200) {
        return Future.value(unit);
      }
      throw ServerException();
    }
    throw ConnectionOffline();
  }
}
