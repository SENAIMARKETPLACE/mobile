import 'package:cep/src/features/register/data/datasources/company_remote_data_source.dart';
import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/data/models/company_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../core/fixtures/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client mockClient;
  late ICompanyRemoteDataSource remoteCompanyDataSource;

  setUp(() {
    mockClient = MockClient();
    remoteCompanyDataSource = CompanyRemoteDataSourceImpl(client: mockClient);
  });

  group('PostCompany', () {
    const endPoint = 'https://63e0f981dd7041cafb3dc894.mockapi.io/Company';

    const tModel = CompanyModel(
      logoModel: 'url img',
      nomeFantasiaModel: 'Dev Business',
      idModel: '8',
      cnpjModel: '12345678000199',
      nomeProprietarioModel: 'Flávio Romeiro',
      razaoSocialModel: 'Minha Empresa LTDA',
      enderecoModel: [],
      telefoneModel: '11999999999',
      emailModel: 'flavio@gmail.com',
      senhaModel: 'admin123',
    );
    const tModelWithAddress = CompanyModel(
      logoModel: 'url img',
      nomeFantasiaModel: 'Dev Business',
      idModel: '8',
      cnpjModel: '12345678000199',
      nomeProprietarioModel: 'Flávio Romeiro',
      razaoSocialModel: 'Minha Empresa LTDA',
      enderecoModel: [
        AddressModel(
          ibge: '3522505',
          cepModel: '06693-220',
          logradouroModel: 'Rua Osvaldo Francisco',
          complementoModel: '',
          bairroModel: 'Jardim Dona Elvira',
          localidadeModel: 'Itapevi',
          numeroModel: '77',
          ufModel: 'SP',
        )
      ],
      telefoneModel: '11999999999',
      emailModel: 'flavio@gmail.com',
      senhaModel: 'admin123',
    );

    setUp(() => registerFallbackValue(Uri.parse(endPoint)));

    test('Should return status code 200 when API response is positive',
        () async {
      when(
        () => mockClient.post(
          any(),
          body: any(named: 'body')
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixture(
            'company.json',
          ),
          200,
        ),
      );

      final result = await remoteCompanyDataSource.register(company: tModel);
      final resultAddress =
          await remoteCompanyDataSource.register(company: tModelWithAddress);

      expect(result, isA<Unit>());
      expect(resultAddress, isA<Unit>());
      verify(() => mockClient.post(Uri.parse(endPoint), body: tModel.toJson(),),).called(1);
      verify(() => mockClient.post(Uri.parse(endPoint), body: tModelWithAddress.toJson(),),).called(1);
    });
  });
}
