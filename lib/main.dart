import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/feature/auth/presentation/screen/create_profile_screen.dart';
import 'package:easy_cart/feature/auth/presentation/screen/login_screen.dart';
import 'package:easy_cart/feature/onboarding/presentation/screen/splash_screen.dart';
import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:easy_cart/utils/core/init_depentency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthBloc>(),
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
      home: const CreateProfile(),
    );
  }
}
