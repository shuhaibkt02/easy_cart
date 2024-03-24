import 'package:easy_cart/feature/auth/data/repositery/auth_repositery.dart';
import 'package:easy_cart/feature/auth/data/source/auth_remote_source.dart';
import 'package:easy_cart/feature/auth/domain/use%20cases/sign_up_case.dart';
import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/feature/auth/presentation/screen/sign_up_screen.dart';
import 'package:easy_cart/utils/core/api_sec.dart';
// import 'package:easy_cart/feature/onboarding/presentation/screen/splash_screen.dart';
import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: BaseUri.supabaseURI, anonKey: BaseUri.supabaseKEY);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            userSignUp: UserSignUp(
              authRepositery: AuthRepositery(
                authRemoteDataSource: AuthRemoteDataSource(
                  supabaseClient: supabase.client,
                ),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Easy Cart',
      home: const SignUpScreen(),
    );
  }
}
