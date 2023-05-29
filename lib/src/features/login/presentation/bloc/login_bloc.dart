// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/core/use_case/use_case.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:cep/src/features/login/presentation/bloc/login_event.dart';
import 'package:cep/src/features/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UseCase<Unit, Login> getLogin;

  LoginBloc({
    required this.getLogin,
  }) : super(LoginState.initial()) {
    on<LoginAccessEvent>(_onLogin);
  }

  Future<void> _onLogin(
    LoginAccessEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await getLogin(event.credenciais);

    result.fold(
      (failure) {
        return emit(state.copyWith(
          status: LoginStatus.failure,
          message: failure.message,
        ));
      },
      (_) => emit(
        state.copyWith(
          status: LoginStatus.success,
        ),
      ),
    );
  }
}
