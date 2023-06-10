import 'package:cep/src/core/network/network_info.dart';
import 'package:cep/src/core/params/params.dart';
import 'package:cep/src/core/params/params_global.dart';
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
import 'package:cep/src/features/categorias/domain/usecases/get_sub_categorias_use_case.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/login/data/datasources/login_remote_data_source.dart';
import 'package:cep/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:cep/src/features/login/domain/repositories/login_repository.dart';
import 'package:cep/src/features/login/domain/usecases/logar_use_case.dart';
import 'package:cep/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:cep/src/features/produtos/data/datasources/produto_remote_data_source.dart';
import 'package:cep/src/features/produtos/data/repositories/produto_repository_impl.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/domain/repositories/produto_repository.dart';
import 'package:cep/src/features/produtos/domain/usecases/create_produto_use_case.dart';
import 'package:cep/src/features/produtos/domain/usecases/delete_produto_use_case.dart';
import 'package:cep/src/features/produtos/domain/usecases/get_all_produtos_company_use_case.dart';
import 'package:cep/src/features/produtos/domain/usecases/get_all_produtos_sub_categoria_use_case.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'features/cadastro/domain/entities/address.dart';

final dependency = GetIt.instance;

Future<void> init() async {
  dependency.registerLazySingleton(Client.new);
  dependency.registerLazySingleton<NetworkInfo>(
    NetworkInfoImpl.new,
  );

  _setupSignup();
  _setupLogin();
  _setUpCategoria();
  _setUpProdutos();
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

    // Bloc
    ..registerFactory<CategoriaBloc>(
      () => CategoriaBloc(
        getCategorias: dependency(),
        getSubCategorias: dependency(),
        getAllCategorias: dependency(),
      ),
    )

    // Use Case
    ..registerLazySingleton<UseCase<List<Categoria>, NoParams>>(
      () => GetAllCategoriasUseCase(
        repository: dependency(),
      ),
    )
    ..registerLazySingleton<UseCase<List<SubCategoria>, Params>>(
      () => GetSubCategoriasUseCase(
        repository: dependency(),
      ),
    )
    ..registerLazySingleton<UseCase<List<SubCategoria>, NoParams>>(
        () => GetAllSubCategoriasUseCase(repository: dependency()))

    // Repository
    ..registerLazySingleton<CategoriaRepository>(
      () => CategoriaRepositoryImpl(
        categoriaRemoteDataSource: dependency(),
      ),
    )

    // Data Source
    ..registerLazySingleton<ICategoriaRemoteDataSource>(
      () => CategoriaRemoteDataSourceImpl(
        client: dependency(),
        network: dependency(),
      ),
    );
}

void _setUpProdutos() {
  dependency

    // Bloc
    ..registerFactory<ProdutoBloc>(() => ProdutoBloc(
          getProdutos: dependency(),
          getAllProdutos: dependency(instanceName: 'GetAll'),
          createProduto: dependency(instanceName: 'Create'),
        ))

    // Use Case
    ..registerLazySingleton<UseCase<Unit, Produto>>(
      instanceName: 'Create',
      () => CreateProdutoUseCase(
        repository: dependency(),
      ),
    )
    ..registerLazySingleton<UseCase<Unit, Params>>(
      () => DeleteProdutoUseCase(
        repository: dependency(),
      ),
    )
    ..registerLazySingleton<UseCase<List<Produto>, ParamsGlobal>>(
      // instanceName: 'get',
      instanceName: 'GetAll',
      () => GetAllProdutosCompanyUseCase(
        repository: dependency(),
      ),
    )
    ..registerLazySingleton<UseCase<List<Produto>, ParamsGlobal>>(
      () => GetAllProdutosSubCategoriaUseCase(
        repository: dependency(),
      ),
    )

    // Repository
    ..registerLazySingleton<ProdutoRepository>(
      () => ProdutoRepositoryImpl(
        produtoRemoteDataSource: dependency(),
      ),
    )

    // Data Source
    ..registerLazySingleton<IProdutoRemoteDataSource>(
      () => ProdutoRemoteDataSourceImpl(
        client: dependency(),
        network: dependency(),
      ),
    );
}
