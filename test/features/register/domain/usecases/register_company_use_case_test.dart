import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:cep/src/features/register/domain/repositories/register_company_repository.dart';
import 'package:cep/src/features/register/domain/usecases/register_company_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements RegisterCompanyRepository {}

void main() {
  late MockRepository mockRepository;
  late RegisterCompanyUseCase registerCompanyUseCase;

  const company = Company(
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
  setUp(
    () {
      mockRepository = MockRepository();
      registerCompanyUseCase =
          RegisterCompanyUseCase(registerRepository: mockRepository);
      registerFallbackValue(company);
    },
  );


  test('must register company in repository', () async {
    when(
      () => mockRepository.registerCompany(any()),
    ).thenAnswer(
      (_) async => const Right(unit),
    );

    final registerCompanyResult = await registerCompanyUseCase.call(company);

    expect(registerCompanyResult, const Right(unit));
  });
}
