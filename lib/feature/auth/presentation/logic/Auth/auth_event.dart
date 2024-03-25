part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignUp extends AuthEvent {
  final String name, email, password;

  AuthSignUp({required this.name, required this.email, required this.password});
}

class AuthLogin extends AuthEvent {
  final String email, password;

  AuthLogin({required this.email, required this.password});
}
