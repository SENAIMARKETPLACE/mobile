import 'dart:async';

import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_event.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCompanyBloc
    extends Bloc<IRegisterCompanyEvent, RegisterCompanyState> {
  final UseCase<Address, String> getCep;

  RegisterCompanyBloc({
    required this.getCep,
  }) : super(RegisterCompanyState.initial()) {
    on<GetCepEvent>(_getCep);
  }

  Future<void> _getCep(
    GetCepEvent event,
    Emitter<RegisterCompanyState> emit,
  ) async {
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
          endereco: Address(
            id: address.id,
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
}
