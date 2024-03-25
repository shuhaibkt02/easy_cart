part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserEntity uuid;

  AuthSuccess({required this.uuid});
}

final class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}
