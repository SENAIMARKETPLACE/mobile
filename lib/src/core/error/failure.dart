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
          message: 'Erro no Servidor. Tente novamente',
        );
}
class NotFoundFailure extends Failure {
  const NotFoundFailure()
      : super(
          message: 'E-mail e Senha inválido. Tente novamente',
        );
}
class ConnectionOfflineFailure extends Failure {
  const ConnectionOfflineFailure()
      : super(
          message: 'Verifique a sua conexão',
        );
}
