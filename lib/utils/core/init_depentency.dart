import 'package:easy_cart/feature/auth/data/repositery/auth_repositery.dart';
import 'package:easy_cart/feature/auth/data/source/auth_remote_source.dart';
import 'package:easy_cart/feature/auth/domain/use%20cases/login_case.dart';
import 'package:easy_cart/feature/auth/domain/use%20cases/sign_up_case.dart';
import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/utils/core/api_sec.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: BaseUri.supabaseURI, anonKey: BaseUri.supabaseKEY);

  serviceLocator.registerLazySingleton(() => supabase);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      supabaseClient: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepositery>(
    () => AuthRepositery(
      authRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<UserSignUp>(
    () => UserSignUp(
      authRepositery: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<LoginCase>(
    () => LoginCase(
      authRepositery: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      loginCase: serviceLocator(),
    ),
  );
}
