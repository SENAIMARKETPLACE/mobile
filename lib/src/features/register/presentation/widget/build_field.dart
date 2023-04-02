// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildField extends StatelessWidget {
  const BuildField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.keyboard,
    this.formatter,
    required this.validator,
    this.isObscure = false,
    this.prefixIcon,
    this.suffixIcon,
     this.isRead = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboard;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?) validator;
  final bool isObscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboard,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.shade300,
      ),
      readOnly: isRead,
      inputFormatters: formatter,
      validator: validator,
    );
  }
}
