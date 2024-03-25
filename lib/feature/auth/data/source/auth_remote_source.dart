import 'package:easy_cart/feature/auth/data/model/user_model.dart';
import 'package:easy_cart/utils/core/error/server_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteService {
  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSource implements AuthRemoteService {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSource({required this.supabaseClient});
  @override
  Future<UserModel> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final res = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (res.user == null) {
        throw ServerException(errorMessage: 'User not exist');
      }
      return UserModel.fromJson(res.user!.toJson());
    } on ServerException catch (e) {
      throw ServerException(errorMessage: '$e');
    }
  }

  @override
  Future<UserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      );

      if (response.user == null) {
        throw ServerException(errorMessage: 'User is null');
      }

      return UserModel.fromJson(response.user!.toJson());
    } on ServerException catch (e) {
      throw ServerException(errorMessage: '$e');
    }
  }
}
