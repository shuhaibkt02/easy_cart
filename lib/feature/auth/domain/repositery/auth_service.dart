import 'package:easy_cart/feature/auth/domain/entities/user_entities.dart';
import 'package:easy_cart/utils/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthService {
  Future<Either<Failure, UserEntity>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });
}
