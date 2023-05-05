// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:cep/src/features/login/data/models/login_model.dart';

abstract class ILoginRemoteDataSource {
  Future<Unit> logar({required LoginModel login});
}

class LoginRemoteDataSourceImpl implements ILoginRemoteDataSource {
  final http.Client client;
  final NetworkInfo network;

  LoginRemoteDataSourceImpl({
    required this.network,
    required this.client,
  });

  @override
  Future<Unit> logar({required LoginModel login}) async {
    var url = 'http://172.27.160.1:8000/api/business/login';
    final requestBody = login.toJson();
    final isConnected = await network.isConnected;
    final response = await client.post(
      Uri.parse(url),
      body: requestBody,
      headers: {'content-type': 'application/json'},
    );

    if (isConnected) {
      switch (response.statusCode) {
        case 200:
          final data = Access.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);
          PreferencesActions.save(data);

          return Future.value(unit);
        case 404:
          return throw NotFoundCompany();
        default:
          throw ServerException();
      }
    }
    throw ConnectionOffline();
  }
}
