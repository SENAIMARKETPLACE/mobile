import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetTextFieldRegister extends StatelessWidget {
  const WidgetTextFieldRegister({
    super.key,
    required this.label,
    required this.hint,
  });

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 7),
        Form(
          child: TextFormField(
            inputFormatters: [
              CnpjInputFormatter(),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(54, 158, 158, 158),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
