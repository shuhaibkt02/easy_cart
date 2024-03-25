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

  serviceLocator.registerLazySingleton<SupabaseClient>(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      supabaseClient: serviceLocator<SupabaseClient>(),
    ),
  );

  serviceLocator.registerFactory<AuthRepositery>(
    () => AuthRepositery(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>(),
    ),
  );

  serviceLocator.registerFactory<UserSignUp>(
    () => UserSignUp(
      authRepositery: serviceLocator<AuthRepositery>(),
    ),
  );
  serviceLocator.registerFactory<LoginCase>(
    () => LoginCase(
      authRepositery: serviceLocator<AuthRepositery>(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userSignUp: serviceLocator<UserSignUp>(),
      loginCase: serviceLocator<LoginCase>(),
    ),
  );
}
