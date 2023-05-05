import 'package:cep/src/core/params/params.dart';
import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/cadastro/data/datasources/address_remote_data_source.dart';
import 'package:cep/src/features/cadastro/data/datasources/company_remote_data_source.dart';
import 'package:cep/src/features/cadastro/data/repositories/register_company_repository_impl.dart';
import 'package:cep/src/features/cadastro/domain/entities/company.dart';
import 'package:cep/src/features/cadastro/domain/repositories/register_company_repository.dart';
import 'package:cep/src/features/cadastro/domain/usecases/get_cep_use_case.dart';
import 'package:cep/src/features/cadastro/domain/usecases/register_company_use_case.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/categorias/data/datasources/categorias_remote_data_source.dart';
import 'package:cep/src/features/categorias/data/repositories/categoria_repository_impl.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/categorias/domain/repositories/categoria_repository.dart';
import 'package:cep/src/features/categorias/domain/usecases/get_all_categorias_use_case.dart';
import 'package:cep/src/features/categorias/domain/usecases/get_all_sub_categorias_use_case.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/login/data/datasources/login_remote_data_source.dart';
import 'package:cep/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:cep/src/features/login/domain/repositories/login_repository.dart';
import 'package:cep/src/features/login/domain/usecases/logar_use_case.dart';
import 'package:cep/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'features/cadastro/domain/entities/address.dart';

final dependency = GetIt.instance;

Future<void> init() async {
  dependency.registerLazySingleton(Client.new);

  _setupSignup();
  _setupLogin();
  _setUpCategoria();
}

void _setupSignup() {
  dependency.registerFactory<RegisterCompanyBloc>(
    () => RegisterCompanyBloc(getCep: dependency(), setCompany: dependency()),
  );

  dependency.registerLazySingleton<UseCase<Address, String>>(
    () => GetCepUseCase(dependency()),
  );
  dependency.registerLazySingleton<UseCase<Unit, Company>>(
    () => RegisterCompanyUseCase(registerRepository: dependency()),
  );

  dependency.registerLazySingleton<RegisterCompanyRepository>(
    () => RegisterCompanyRepositoryImpl(
      addressRemoteDataSource: dependency(),
      companyRemoteDataSource: dependency(),
    ),
  );

  dependency.registerLazySingleton<IAddressRemoteDataSource>(
    () => AddressRemoteDataSourceImpl(
        client: dependency(), network: dependency()),
  );
  dependency.registerLazySingleton<ICompanyRemoteDataSource>(
    () => CompanyRemoteDataSourceImpl(
      client: dependency(),
      network: dependency(),
    ),
  );
}

void _setupLogin() {
  dependency.registerFactory<LoginBloc>(
    () => LoginBloc(
      getLogin: dependency(),
    ),
  );

  dependency.registerLazySingleton<UseCase<Unit, Login>>(
    () => LogarUseCase(loginRepository: dependency()),
  );

  dependency.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      loginRemoteDataSource: dependency(),
    ),
  );

  dependency.registerLazySingleton<ILoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(
            client: dependency(),
            network: dependency(),
          ));
}

void _setUpCategoria() {
  dependency
    ..registerFactory<CategoriaBloc>(
      () => CategoriaBloc(
        getCategorias: dependency(),
        getSubCategorias: dependency(),
      ),
    )
    ..registerLazySingleton<UseCase<List<Categoria>, NoParams>>(
      () => GetAllCategoriasUseCase(
        repository: dependency(),
      ),
    )
    ..registerLazySingleton<UseCase<List<SubCategoria>, Params>>(
      () => GetAllSubCategoriasUseCase(
        repository: dependency(),
      ),
    )
    ..registerLazySingleton<CategoriaRepository>(
      () => CategoriaRepositoryImpl(
        categoriaRemoteDataSource: dependency(),
      ),
    )
    ..registerLazySingleton<ICategoriaRemoteDataSource>(
      () => CategoriaRemoteDataSourceImpl(
        client: dependency(),
        network: dependency(),
      ),
    );
}
