// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final String cep;

  const Params({
    required this.cep,
  });

  @override
  List<Object?> get props => [cep];
}
