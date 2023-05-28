import 'dart:async';

import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/features/home/presentation/bloc/home_event.dart';
import 'package:cep/src/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<UpdateHomeEvent>(_getUpdates);
  }

  Future<void> _getUpdates(
    UpdateHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );

    final result = await PreferencesActions.load();

    if (result.nome.isEmpty) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          message: 'Erro ao carregar o nome',
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.success,
          title: result.nome,
        ),
      );
      
    }
  }
}
