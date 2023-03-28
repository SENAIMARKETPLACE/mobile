import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/features/register/data/datasources/address_remote_data_source.dart';
import 'package:cep/src/features/register/data/datasources/company_remote_data_source.dart';
import 'package:cep/src/features/register/data/models/address_model.dart';
import 'package:cep/src/features/register/data/models/company_model.dart';
import 'package:cep/src/features/register/data/repositories/register_company_repository_impl.dart';
import 'package:cep/src/features/register/domain/repositories/register_company_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddressRemoteDataSource extends Mock
    implements AddressRemoteDataSourceImpl {}

class MockCompanyRemoteDataSource extends Mock
    implements CompanyRemoteDataSourceImpl {}

void main() {
  late AddressRemoteDataSourceImpl mockAddressDataSource;
  late CompanyRemoteDataSourceImpl mockCompanyDataSource;
  late RegisterCompanyRepository repository;

  setUp(() {
    mockAddressDataSource = MockAddressRemoteDataSource();
    mockCompanyDataSource = MockCompanyRemoteDataSource();
    repository = RegisterCompanyRepositoryImpl(
      addressRemoteDataSource: mockAddressDataSource,
      companyRemoteDataSource: mockCompanyDataSource,
    );
  });

  const cep = '06693220';

  const address = AddressModel(
    ibge: '3522505',
    cepModel: '06693-220',
    logradouroModel: 'Rua Osvaldo Francisco',
    complementoModel: '',
    bairroModel: 'Jardim Dona Elvira',
    localidadeModel: 'Itapevi',
    numeroModel: '77',
    ufModel: 'SP',
  );

  const company = CompanyModel(
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

  setUpAll(() {
    registerFallbackValue(company);
  });
  group('CEP', () {
    test(
      'Must return a model addresss from the data source',
      () async {
        when(
          () => mockAddressDataSource.getAddress(cep: cep),
        ).thenAnswer((_) async => address);

        final addressResult = await repository.getCep(cep);

        expect(addressResult, const Right(address));
        verify(() => mockAddressDataSource.getAddress(cep: cep));
        verifyNoMoreInteractions(mockAddressDataSource);
      },
    );

    test('Must return an exception from the data source', () {
      when(
        () => mockAddressDataSource.getAddress(cep: '06693220'),
      ).thenThrow(ServerException());
    });
  });

  group('Company', () {
    test(
      'Must return a Company model from the data source',
      () async {
        when(
          () => mockCompanyDataSource.register(
            company: company,
          ),
        ).thenAnswer((_) async => unit);

        final companyResult = await repository.registerCompany(company);

        expect(companyResult, const Right(unit));
        // verify(
        //   () => mockCompanyDataSource.registerCompany(company: company)
        // );
        // verifyNoMoreInteractions(mockCompanyDataSource);
      },
    );
  });
}
