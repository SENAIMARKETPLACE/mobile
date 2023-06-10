import 'package:flutter/material.dart';

class SollarisErrorSnackBar extends SnackBar {
  SollarisErrorSnackBar({super.key, required this.message})
      : super(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          content: Text(
            message!,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.red.shade800,
        );

  /// Message to be showed at SnackBar
  final String? message;
}
