part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignUp extends AuthEvent {
  final String name, email, password, phone, gender,imagePath;

  AuthSignUp({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.imagePath,
  });
}

class AuthLogin extends AuthEvent {
  final String email, password;

  AuthLogin({required this.email, required this.password});
}
