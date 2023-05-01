import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class ServerFailure extends Failure {
  const ServerFailure()
      : super(
          message: 'Erro no Servidor. Tente novamente mais tarde.',
        );
}
class NotFoundFailure extends Failure {
  const NotFoundFailure()
      : super(
          message: 'E-mail e Senha inválido',
        );
}
