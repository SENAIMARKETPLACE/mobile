import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetTextFieldRegister extends StatefulWidget {
  WidgetTextFieldRegister({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    this.inputFormatter,
    required this.controller, required this.keyButton,
  });

  final String label;
  final String hint;
  List<TextInputFormatter>? inputFormatter;
  String? Function(String?) validator;
  final TextEditingController controller;
  final GlobalKey<FormState> keyButton;

  @override
  State<WidgetTextFieldRegister> createState() =>
      _WidgetTextFieldRegisterState();
}

class _WidgetTextFieldRegisterState extends State<WidgetTextFieldRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Form(
        key: widget.keyButton,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              inputFormatters: widget.inputFormatter,
              validator: widget.validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(54, 158, 158, 158),
                hintText: widget.hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
