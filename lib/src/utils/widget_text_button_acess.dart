import 'package:flutter/material.dart';

class WidgetTextButtonAcess extends StatelessWidget {
  const WidgetTextButtonAcess({super.key, required this.action});

  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xff14C871),
          padding: const EdgeInsets.only(
            left: 45,
            right: 45,
          ),
        ),
        onPressed: action,
        child: const Text(
          'Acessar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
