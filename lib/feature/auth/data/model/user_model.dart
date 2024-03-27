import 'package:easy_cart/feature/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uuid,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuid: json['id'] ?? '',
        name: json["raw_user_meta_data"]['name'] ?? '',
        email: json['email'] ?? '',
      );
}
