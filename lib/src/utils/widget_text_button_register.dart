import 'package:flutter/material.dart';

class WidgetTextButtonRegister extends StatelessWidget {
  const WidgetTextButtonRegister({super.key, required this.action});

  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.grey)),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(
            left: 45,
            right: 45,
          ),
        ),
        onPressed: action,
        child: const Text(
          'Cadastrar',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
