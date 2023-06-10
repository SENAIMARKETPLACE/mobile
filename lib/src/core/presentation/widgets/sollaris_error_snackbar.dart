import 'package:flutter/material.dart';

class SollarisErrorSnackBar extends SnackBar {
  SollarisErrorSnackBar({super.key, required this.message})
      : super(
          content: Text(
            message!
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade800,
        );

  /// Message to be showed at SnackBar
  final String? message;
}