// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LoginAccessEvent extends LoginEvent {
  const LoginAccessEvent({
    required this.credenciais,
  });

  final Login credenciais;

  @override
  List<Object> get props => [
        credenciais,
      ];
}
