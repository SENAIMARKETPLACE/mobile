import 'package:flutter/material.dart';

class SollarisErrorSnackBar extends SnackBar {
  SollarisErrorSnackBar({super.key, required this.message})
      : super(
          content: Text(
            message ??
                '''Houve um erro ao realizar a solicitação! Se o erro persistir, entre em contato com o suporte para mais informações.''',
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade800,
        );

  /// Message to be showed at SnackBar
  final String? message;
}