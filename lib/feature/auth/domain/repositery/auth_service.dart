import 'package:easy_cart/utils/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthService {
  Future<Either<Failure, String>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });
}
