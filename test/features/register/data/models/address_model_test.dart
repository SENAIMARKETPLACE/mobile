import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
  const tModel = AddressModel(
    ibge: '3522505',
    cepModel: '06693-220',
    logradouroModel: 'Rua Osvaldo Francisco',
    complementoModel: '',
    bairroModel: 'Jardim Dona Elvira',
    localidadeModel: 'Itapevi',
    numeroModel: '77',
    ufModel: 'SP',
  );

  test('should be a subclass from Address entity', () {
    expect(tModel, const TypeMatcher<Address>());
  });

  test('should return a AddressModel object from a json', () {
    final model = AddressModel.fromJson(fixture("address.json"));

    expect(model, tModel);
  });

  test('should return a json from a AddressModel object', () {
    final jsonResult = tModel.toJson();

    expect(jsonResult, isA<String>());
  });
}
