import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/register/data/datasources/address_remote_data_source.dart';
import 'package:cep/src/features/register/data/repositories/register_company_repository_impl.dart';
import 'package:cep/src/features/register/domain/repositories/register_company_repository.dart';
import 'package:cep/src/features/register/domain/usecases/get_cep_use_case.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'features/register/domain/entities/address.dart';

final dependency = GetIt.instance;

Future<void> init() async {
  dependency.registerLazySingleton(Client.new);

  _setupSignup();
}

void _setupSignup() {
  dependency.registerFactory<RegisterCompanyBloc>(
    () => RegisterCompanyBloc(
      getCep: dependency(),
    ),
  );

  dependency.registerLazySingleton<UseCase<Address, String>>(
    () => GetCepUseCase(dependency()),
  );

  dependency.registerLazySingleton<RegisterCompanyRepository>(
    () => RegisterCompanyRepositoryImpl(
      remoteDataSource: dependency(),
    ),
  );

  dependency.registerLazySingleton<IAddressRemoteDataSource>(
    () => AddressRemoteDataSourceImpl(
      client: dependency(),
    ),
  );
}
