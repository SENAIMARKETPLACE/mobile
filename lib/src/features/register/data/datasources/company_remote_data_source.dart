// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/features/register/data/models/company_model.dart';
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
    const url = 'https://63e0f981dd7041cafb3dc894.mockapi.io/Company';
    final requestBody = company.toJson();
    final response =
        await client.post(Uri.parse(url), body: requestBody, headers: {
      'content-type': 'application/json',
    }).then((value) {
      if (value.statusCode == 201) {
        return Future.value(unit);
      } 
    });
        throw ServerException();
  }
}
