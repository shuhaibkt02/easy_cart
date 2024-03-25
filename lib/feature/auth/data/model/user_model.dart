import 'package:easy_cart/feature/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uuid,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuid: json['uuid'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
      );
}
