import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({super.key, required this.title});

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
