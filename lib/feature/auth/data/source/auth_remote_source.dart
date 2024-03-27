import 'dart:io';

import 'package:easy_cart/feature/auth/data/model/user_model.dart';
import 'package:easy_cart/utils/core/error/server_exception.dart';
import 'package:mime/mime.dart';
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
    required String phone,
    required String gender,
    required String imagePath,
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
    required String phone,
    required String gender,
    required String imagePath,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        phone: phone,
        data: {
          'name': name,
          'phone': phone,
          'gender': gender,
        },
      );

      if (response.user == null) {
        throw ServerException(errorMessage: 'User is null');
      }

      final bytes = await File(imagePath).readAsBytes();
      final fileExt = imagePath.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      await supabaseClient.storage.from('avatars').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: lookupMimeType(imagePath)),
          );

      return UserModel.fromJson(response.user!.toJson());
    } on ServerException catch (e) {
      throw ServerException(errorMessage: '$e');
    }
  }
}
