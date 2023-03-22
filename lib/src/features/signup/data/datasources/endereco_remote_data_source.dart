// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;
import 'package:sollaris_teste/src/core/error/exceptions.dart';

import 'package:sollaris_teste/src/features/signup/data/models/EnderecoModel.dart';

abstract class EnderecoRemoteDataSource {
  Future<EnderecoModel> getEndereco({required String cep});
}

class EnderecoRemoteDataSourceImpl implements EnderecoRemoteDataSource {
  final http.Client client;

  EnderecoRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<EnderecoModel> getEndereco({required String cep}) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = response.body;

      return Future.value(EnderecoModel.fromJson(json));
    }

    throw ServerException();
  }
}
