// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/network/network_info.dart';
import 'package:cep/src/features/cadastro/data/models/company_model.dart';

abstract class ICompanyRemoteDataSource {
  Future<Unit> register({required CompanyModel company});
}

class CompanyRemoteDataSourceImpl implements ICompanyRemoteDataSource {
  final http.Client client;
  final NetworkInfo network;

  CompanyRemoteDataSourceImpl({
    required this.client,
    required this.network,
  });

  @override
  Future<Unit> register({required CompanyModel company}) async {
    var url = 'http://172.27.160.1:8000/api/business';
    final requestBody = company.toJson();
    final isConnected = await network.isConnected;

    final response = await client.post(
      Uri.parse(url),
      body: requestBody,
      headers: {'content-type': 'application/json'},
    );

    if (isConnected) {
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Future.value(unit);
      } else {
        throw ServerException();
      }
    }
    throw ConnectionOffline();
  }
}
