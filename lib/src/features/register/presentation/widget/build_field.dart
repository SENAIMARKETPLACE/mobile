// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BuildField extends StatelessWidget {
  const BuildField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.keyboard,
  }) : super(key: key);

  // final String value;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    // controller.text = value;

    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),
        fillColor: Colors.black,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo Inválido. Digite novamente.';
        }
        return null;
      },
    );
  }
}
