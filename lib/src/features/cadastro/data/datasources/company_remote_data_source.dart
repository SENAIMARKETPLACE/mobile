// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/features/cadastro/data/models/company_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class ICompanyRemoteDataSource {
  Future<Unit> register({required CompanyModel company});
}

class CompanyRemoteDataSourceImpl implements ICompanyRemoteDataSource {
  final http.Client client;

  CompanyRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<Unit> register({required CompanyModel company}) async {
    const url = 'http://192.168.208.1:8000/api/business';
    final requestBody = company.toJson();
    final response = await client.post(
      Uri.parse(url),
      body: requestBody,
      headers: {'content-type': 'application/json'},
    );

    log('${response.statusCode}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
