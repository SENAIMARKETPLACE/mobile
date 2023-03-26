import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/repositories/register_company_repository.dart';
import 'package:cep/src/features/register/domain/usecases/get_cep_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements RegisterCompanyRepository {}

void main() {
  late GetCepUseCase getCepUseCase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getCepUseCase = GetCepUseCase(mockRepository);
  });

  const address = Address(
    id: '1',
    cep: '06693220',
    numero: '77',
    estado: 'São Paulo',
    bairro: 'Jardim Dona Elvira',
    cidade: 'Itapevi',
    logradouro: 'Rua Osvaldo Francisco',
  );

  test(
    'Should get postcode from repository',
    () async {
      when(() => mockRepository.getCep(any())).thenAnswer(
        (_) async => const Right(address),
      );

      final getCepResult = await getCepUseCase.call('06693220');

      expect(getCepResult, const Right(address));
      verify(
        () => mockRepository.getCep('06693220'),
      );
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
