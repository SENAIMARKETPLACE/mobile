import 'package:cep/src/features/register/data/datasources/address_remote_data_source.dart';
import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../core/fixtures/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client mockClient;
  late IAddressRemoteDataSource remoteAddressDataSource;

  setUp(() {
    mockClient = MockClient();
    remoteAddressDataSource = AddressRemoteDataSourceImpl(client: mockClient);
  });

  group('getCep', () {
    setUp(
      () => registerFallbackValue(
          Uri.parse('https://viacep.com.br/ws/06693220/json/')),
    );

    test('should return an address template when the API response is positive',
        () async {
      when(
        () => mockClient.get(any()),
      ).thenAnswer(
        (_) async => http.Response(
          fixture('address.json'),
          200,
        ),
      );

      final result = await remoteAddressDataSource.getAddress(cep: '06693220');

      const expectedAddress = AddressModel(
        ibge: '3522505',
        cepModel: '06693-220',
        logradouroModel: 'Rua Osvaldo Francisco',
        complementoModel: '',
        bairroModel: 'Jardim Dona Elvira',
        localidadeModel: 'Itapevi',
        numeroModel: '77',
        ufModel: 'SP',
      );

      expect(result, equals(expectedAddress));
      verify(
        () => mockClient
            .get(Uri.parse('https://viacep.com.br/ws/06693220/json/')),
      ).called(1);
    });
  });
}
