import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Must be same Company entity',
    () {
      const company = Company(
        logo: 'url img',
        nomeFantasia: 'Dev Business',
        id: '2',
        nomeProprietario: 'Flávio George da Silva Romeiro',
        razaoSocial: 'Minha Empresa LTDA',
        cnpj: '12345678000199',
        telefone: '99999-9999',
        email: 'flavio.romeiro20@outlook.com',
        senha: 'admin123',
        endereco: [
          Address(
            id: '1',
            cep: '06693220',
            numero: '77',
            estado: 'São Paulo',
            bairro: 'Jardim Dona Elvira',
            cidade: 'Itapevi',
            logradouro: 'Rua Osvaldo Francisco',
          )
        ],
      );
      const companyTest = Company(
        id: '2',
        nomeProprietario: 'Flávio George da Silva Romeiro',
        razaoSocial: 'Minha Empresa LTDA',
        cnpj: '12345678000199',
        telefone: '99999-9999',
        email: 'flavio.romeiro20@outlook.com',
        senha: 'admin123',
        endereco: [
          Address(
            id: '1',
            cep: '06693220',
            numero: '77',
            estado: 'São Paulo',
            bairro: 'Jardim Dona Elvira',
            cidade: 'Itapevi',
            logradouro: 'Rua Osvaldo Francisco',
          )
        ],
      );

      expect(company, equals(companyTest));
    },
  );
}
