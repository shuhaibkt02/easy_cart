import 'package:easy_cart/feature/auth/data/source/auth_remote_source.dart';
import 'package:easy_cart/feature/auth/domain/repositery/auth_service.dart';
import 'package:easy_cart/utils/core/error/failure.dart';
import 'package:easy_cart/utils/core/error/server_exception.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositery implements AuthService {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositery({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, String>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final userId = await authRemoteDataSource.loginWithEmail(
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(errorMessage: '$e'));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmail(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(errorMessage: '$e'));
    }
  }
}
