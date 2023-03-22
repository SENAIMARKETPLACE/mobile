// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class GetCepEvent extends SignUpEvent {
  final String cep;

  const GetCepEvent({
    required this.cep,
  });

  @override
  List<Object?> get props => [cep];
}
