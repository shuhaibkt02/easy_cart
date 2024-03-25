import 'package:easy_cart/feature/auth/domain/entities/user_entities.dart';
import 'package:easy_cart/feature/auth/domain/repositery/auth_service.dart';
import 'package:easy_cart/utils/core/error/failure.dart';
import 'package:easy_cart/utils/core/use%20case/use_case_service.dart';
import 'package:fpdart/fpdart.dart';

class LoginCase implements UseCase<UserEntity, LoginParams> {
  final AuthService authRepositery;

  LoginCase({required this.authRepositery});

  @override
  Future<Either<Failure, UserEntity>> useCaseCall(LoginParams params) async {
    return await authRepositery.loginWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email, password;

  LoginParams({required this.email, required this.password});
}
