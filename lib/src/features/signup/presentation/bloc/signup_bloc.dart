// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sollaris_teste/src/core/use_case/use_case.dart';
import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';
import 'package:sollaris_teste/src/features/signup/presentation/bloc/signup_event.dart';
import 'package:sollaris_teste/src/features/signup/presentation/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UseCase<Endereco, String> getCep;

  SignUpBloc({
    required this.getCep,
  }) : super(SignUpState.initial()) {
    on<GetCepEvent>(_getCep);
    on<SetCepEvent>(_setCep);
  }

  Future<void> _getCep(
    GetCepEvent event,
    Emitter<SignUpState> emit,
  ) async {
    final getCepResult = await getCep(event.cep);

    getCepResult.fold(
      (failure) => emit(
        state.copyWith(
          status: SignUpStatus.error,
          message: 'Erro ao pesquisar CEP',
        ),
      ),
      (endereco) => emit(
        state.copyWith(
          status: SignUpStatus.sucess,
          endereco: Endereco(
            id: endereco.id,
            cep: endereco.cep,
            numero: endereco.numero,
            estado: endereco.estado,
            bairro: endereco.bairro,
            cidade: endereco.cidade,
            logradouro: endereco.logradouro,
          ),
        ),
      ),
    );
  }

  Future<void> _setCep(
    SetCepEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SignUpStatus.sucess,
        endereco: Endereco(
          id: event.endereco.id,
          cep: event.endereco.cep,
          numero: event.endereco.numero,
          estado: event.endereco.estado,
          bairro: event.endereco.bairro,
          cidade: event.endereco.cidade,
          logradouro: event.endereco.logradouro,
        ),
      ),
    );
  }
}
