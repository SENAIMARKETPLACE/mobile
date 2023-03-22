import 'package:get_it/get_it.dart';
import 'package:sollaris_teste/src/features/signup/data/datasources/endereco_remote_data_source.dart';
import 'package:sollaris_teste/src/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:sollaris_teste/src/features/signup/domain/repositories/signup_repository.dart';
import 'package:sollaris_teste/src/features/signup/domain/usecases/get_cep_use_case.dart';
import 'package:sollaris_teste/src/features/signup/presentation/bloc/signup_bloc.dart';

final dependency = GetIt.instance;

Future<void> init() async {
  dependency.registerFactory<SignUpBloc>(
    () => SignUpBloc(
      getCep: dependency(),
    ),
  );

  dependency.registerLazySingleton(
    () => GetCepUseCase(
      dependency(),
    ),
  );

  dependency.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImpl(
      remoteDataSource: dependency(),
    ),
  );

  dependency.registerLazySingleton<EnderecoRemoteDataSource>(
    () => EnderecoRemoteDataSourceImpl(
      client: dependency(),
    ),
  );
}
