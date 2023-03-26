import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Must be same Address entity', () {
    const address = Address(
      id: '1',
      cep: '06693220',
      numero: '77',
      estado: 'São Paulo',
      bairro: 'Jardim Dona Elvira',
      cidade: 'Itapevi',
      logradouro: 'Rua Osvaldo Francisco',
    );
    const addressTest = Address(
      id: '1',
      cep: '06693220',
      numero: '77',
      estado: 'São Paulo',
      bairro: 'Jardim Dona Elvira',
      cidade: 'Itapevi',
      logradouro: 'Rua Osvaldo Francisco',
    );

    expect(address, equals(addressTest));
  });
}
