// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cep/src/features/register/domain/entities/company.dart';

abstract class IRegisterCompanyEvent extends Equatable {
  const IRegisterCompanyEvent();
}

class GetCepEvent extends IRegisterCompanyEvent {
  final String cep;

  const GetCepEvent({
    required this.cep,
  });

  @override
  List<Object?> get props => [cep];
}

class SetCompanyEvent extends IRegisterCompanyEvent {
  final Company company;

  const SetCompanyEvent({
    required this.company,
  });
  
  @override
  List<Object?> get props => [company];
}
