import 'package:easy_cart/utils/core/error/server_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteService {
  Future<String> loginWithEmail({
    required String email,
    required String password,
  });

  Future<String> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSource implements AuthRemoteService {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSource({required this.supabaseClient});
  @override
  Future<String> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final res = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (res.user == null) {
        throw ServerException(errorMessage: 'User not exist');
      }
      return '${res.user?.id}';
    } on ServerException catch (e) {
      throw ServerException(errorMessage: '$e');
    }
  }

  @override
  Future<String> signUpWithEmail({
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

      return response.user!.id;
    } on ServerException catch (e) {
      throw ServerException(errorMessage: '$e');
    }
  }
}
