// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/features/cadastro/data/models/address_model.dart';
import 'package:http/http.dart' as http;

abstract class IAddressRemoteDataSource {
  Future<AddressModel> getAddress({required String cep});
}

class AddressRemoteDataSourceImpl implements IAddressRemoteDataSource {
  final http.Client client;

  AddressRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<AddressModel> getAddress({required String cep}) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = response.body;

      return Future.value(AddressModel.fromJson(json));
    }

    throw ServerException();
  }
}
