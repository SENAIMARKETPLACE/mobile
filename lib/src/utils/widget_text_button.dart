import 'package:flutter/material.dart';

class WidgetTextButton extends StatefulWidget {
  const WidgetTextButton({super.key, required this.keyButton});

  final GlobalKey<FormState> keyButton;

  @override
  State<WidgetTextButton> createState() => _WidgetTextButtonState();
}

class _WidgetTextButtonState extends State<WidgetTextButton> {
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
            left: 125,
            right: 125,
          ),
        ),
        onPressed: () {
          if (widget.keyButton.currentState!.validate()) {
            print('Passou');
          } else {
            print('Não passou');
          }
        },
        child: const Text(
          'Próximo',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
