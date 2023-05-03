import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categorias_event.dart';
part 'categorias_state.dart';

class CategoriasBloc extends Bloc<CategoriasEvent, CategoriasState> {
  CategoriasBloc() : super(CategoriasInitial()) {
    on<CategoriasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
