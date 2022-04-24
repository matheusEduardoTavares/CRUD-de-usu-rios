import 'dart:convert';

import 'package:user_crud_example/app/models/user/permissions_user_enum.dart';

class User {
  User({
    required this.login,
    required this.password,
    required this.permissionsUserEnum,
  });

  final String password;
  final String login;
  final PermissionsUserEnum permissionsUserEnum;

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'login': login,
      'permissionsUserEnum': permissionsUserEnum.name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      password: map['password'] ?? '',
      login: map['login'] ?? '',
      permissionsUserEnum: PermissionsUserEnum.values.byName(map['permissionsUserEnum']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
