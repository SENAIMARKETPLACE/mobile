// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ParamsGlobal extends Equatable {
  final String idSubCategoria;
  final String idEmpresa;

  const ParamsGlobal({
    required this.idSubCategoria,
    required this.idEmpresa,
  });

  @override
  List<Object> get props => [
        idSubCategoria,
        idEmpresa,
      ];
}
