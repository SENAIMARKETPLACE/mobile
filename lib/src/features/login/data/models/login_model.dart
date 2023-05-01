import 'dart:convert';

import 'package:cep/src/features/login/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.email,
    required super.password,
  });

  factory LoginModel.fromEntity(Login login) {
    return LoginModel(
      email: login.email,
      password: login.password,
    );
  }

  Map<String, String> toMap() {
    return {
      'email': email,
      'senha': password,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
