import 'package:easy_cart/feature/auth/domain/entities/user_entities.dart';
import 'package:easy_cart/feature/auth/domain/repositery/auth_service.dart';
import 'package:easy_cart/utils/core/error/failure.dart';
import 'package:easy_cart/utils/core/use%20case/use_case_service.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<UserEntity, SignUpParams> {
  final AuthService authRepositery;

  UserSignUp({required this.authRepositery});
  @override
  Future<Either<Failure, UserEntity>> useCaseCall(SignUpParams params) async {
    return await authRepositery.signUpWithEmail(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String email, password, name;

  SignUpParams(
      {required this.email, required this.password, required this.name});
}
