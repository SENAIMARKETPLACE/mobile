import 'package:flutter/material.dart';

class WidgetCaption extends StatelessWidget {
  const WidgetCaption({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}