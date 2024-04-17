import 'package:clean_architecture_tdd/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_tdd/core/secrets/app_secrets.dart';
import 'package:clean_architecture_tdd/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:clean_architecture_tdd/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/usecases/user_signin.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/usecases/user_signup.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import "package:get_it/get_it.dart";

final serviceLocator = GetIt.instance;
Future<void> initDependeceis() async {
  _initAuth();
  final Supabase supabase =  await Supabase.initialize(url:AppSecrets.supabaseUrl ,anonKey: AppSecrets.supabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);


  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());

}


void _initAuth(){
  serviceLocator
    // DataSource(Data)
    ..registerFactory<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImplementation(serviceLocator()))

    //  Repository (Domain) 
    ..registerFactory<AuthenticationRepository>(() => AuthenticationRepositoryImplementation(serviceLocator()))

    // Usecase (Domain)
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserSignIn(serviceLocator()))

    // BLOC (Presentation)
    ..registerLazySingleton(() =>AuthBloc(serviceLocator(), serviceLocator(),serviceLocator()));
}