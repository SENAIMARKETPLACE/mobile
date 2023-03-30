// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FieldTest extends StatefulWidget {
  const FieldTest({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  State<FieldTest> createState() => _FieldTestState();
}

class _FieldTestState extends State<FieldTest> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          hintText: 'Ex.: Rua, Avenida, Viaduto',
          labelText: 'Logradouro',
          border: OutlineInputBorder(),
          fillColor: Colors.black),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo Inválido. Digite novamente.';
        }
        return null;
      },
    );
  }
}
