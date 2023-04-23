import 'package:flutter/material.dart';

class SollarisTitle extends StatelessWidget {
  const SollarisTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
