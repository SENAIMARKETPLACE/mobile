import 'package:cep/src/core/error/exceptions.dart';
import 'package:cep/src/core/error/failure.dart';
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
    implements ICompanyRemoteDataSource {}

void main() {
  late AddressRemoteDataSourceImpl mockAddressDataSource;
  late ICompanyRemoteDataSource mockCompanyDataSource;
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
    const tCompany = CompanyModel(
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
      registerFallbackValue(tCompany);
    });

    test(
      'Must return a Company model from the data source',
      () async {
        when(
          () => mockCompanyDataSource.register(
            company: any(named: 'company'),
          ),
        ).thenAnswer((_) async => unit);

        final companyResult = await repository.registerCompany(tCompany);

        expect(companyResult, const Right(unit));
        verify(() =>
                mockCompanyDataSource.register(company: any(named: 'company')))
            .called(1);
        verifyNoMoreInteractions(mockCompanyDataSource);
      },
    );

    test('should return an exception when trying to register a company',
        () async {
           when(
          () => mockCompanyDataSource.register(
            company: any(named: 'company'),
          ),
        ).thenThrow(ServerException());

        final companyResult = await repository.registerCompany(tCompany);

        expect(companyResult, const Left(ServerFailure()));
        
        });
  });
}
