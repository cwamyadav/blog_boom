import 'package:blogging/core/secrets/app_secrets.dart';
import 'package:blogging/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:blogging/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blogging/features/auth/domain/repository/auth_repository.dart';
import 'package:blogging/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blogging/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependecies() async {
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseurl, anonKey: AppSecrets.supabaseAnonKey);

  serviceLocator.registerLazySingleton(() => supabase.client);
  _initAuth();
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator<SupabaseClient>(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    //registerFactory → makes a new instance each time
    () => UserSignUp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    // create one authbloc and use everywhere when needed.
    // Don't create it until someone actually needs it.
    () => AuthBloc(
      userSignup: serviceLocator(),
    ),
  );
}
