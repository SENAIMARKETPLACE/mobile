import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/data/models/company_model.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
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

  group('Company without Address', () {
    test(
      'should be a subclass from Company entity',
      () {
        expect(tModel, const TypeMatcher<Company>());
      },
    );

    test('Should return a CompanyModel object from a json', () {
      final model = CompanyModel.fromJson(fixture('company.json'));

      expect(model, tModel);
    });

    test('Should return a json from a CompanyModel object', () {
      final jsonResult = tModel.toJson();

      expect(jsonResult, isA<String>());
    });
  });

  group('Company with Address', () {
    test(
      'should be a subclass from Company entity',
      () {
        expect(tModelWithAddress, const TypeMatcher<Company>());
      },
    );

    test('Should return a CompanyModel object from a json', () {
      final model = CompanyModel.fromJson(fixture('company_with_address.json'));

      expect(model, tModelWithAddress);
    });

    test('Should return a json from a CompanyModel object', () {
      final stringJson = tModelWithAddress.toJson();

      expect(
        stringJson,
        isA<String>(),
      );
    });
  });
}
