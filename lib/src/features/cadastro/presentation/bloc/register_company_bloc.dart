import 'dart:async';

import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/cadastro/domain/entities/address.dart';
import 'package:cep/src/features/cadastro/domain/entities/company.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_event.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCompanyBloc
    extends Bloc<IRegisterCompanyEvent, RegisterCompanyState> {
  final UseCase<Address, String> getCep;
  final UseCase<Unit, Company> setCompany;

  RegisterCompanyBloc({
    required this.setCompany,
    required this.getCep,
  }) : super(RegisterCompanyState.initial()) {
    on<GetCepEvent>(_getCep);
    on<SetCompanyEvent>(_setCompany);
  }

  Future<void> _getCep(
    GetCepEvent event,
    Emitter<RegisterCompanyState> emit,
  ) async {
    emit(state.copyWith(
      status: RegisterCompanyStatus.loading,
    ));

    final getCepResult = await getCep(event.cep);

    getCepResult.fold(
      (failure) => emit(
        state.copyWith(
          status: RegisterCompanyStatus.error,
          message: 'Erro ao pesquisar CEP',
        ),
      ),
      (address) => emit(
        state.copyWith(
          status: RegisterCompanyStatus.sucess,
          address: Address(
            cep: address.cep,
            numero: address.numero,
            estado: address.estado,
            bairro: address.bairro,
            cidade: address.cidade,
            logradouro: address.logradouro,
          ),
        ),
      ),
    );
  }

  Future<void> _setCompany(
    SetCompanyEvent event,
    Emitter<RegisterCompanyState> emit,
  ) async {
    emit(state.copyWith(status: RegisterCompanyStatus.loading));

    final result = await setCompany(event.company);

    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterCompanyStatus.error,
        message: 'Erro ao cadastrar empresa',
      )),
      (_) => emit(
        state.copyWith(
          status: RegisterCompanyStatus.sucess,
        ),
      ),
    );
  }
}
