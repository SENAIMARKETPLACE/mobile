import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class WidgetTextFieldRegister extends StatelessWidget {
  WidgetTextFieldRegister({
    super.key,
    required this.label,
    required this.hint,
    this.inputFormatter,
    this.typeKey,
    required this.validator,
    required this.controller,
    this.suffixIcon,
    this.isExibPassword = false,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  TextInputType? typeKey;
  List<TextInputFormatter>? inputFormatter;
  String? Function(String?) validator;
  Widget? suffixIcon;
  bool isExibPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 7),
          TextFormField(
            obscureText: isExibPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            keyboardType: typeKey,
            inputFormatters: inputFormatter,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: const Color.fromARGB(54, 158, 158, 158),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
