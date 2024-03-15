import 'dart:convert';

import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.avatar,
  });

  factory UserModel.fromMap(DataMap map) {
    return UserModel(
      id: (map['id'] ?? 0) as int,
      email: (map['email'] ?? '') as String,
      firstName: (map['first_name'] ?? '') as String,
      lastName: (map['last_name'] ?? '') as String,
      avatar: (map['avatar'] ?? '') as String,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as DataMap);

  UserModel copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'UserModel(id: $id, email: $email)';
}
