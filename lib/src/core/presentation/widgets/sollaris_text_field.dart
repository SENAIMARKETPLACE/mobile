import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class SollarisTextField extends StatefulWidget {
  SollarisTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.inputFormatter,
      this.typeKey,
      required this.validator,
      required this.controller,
      this.suffixIcon,
      this.isExibPassword = false,
      this.onSaved});

  final String label;
  final String hint;
  final TextEditingController controller;
  TextInputType? typeKey;
  List<TextInputFormatter>? inputFormatter;
  String? Function(String?) validator;
  void Function(String?)? onSaved;
  Widget? suffixIcon;
  bool isExibPassword;

  @override
  State<SollarisTextField> createState() => _SollarisTextFieldState();
}

class _SollarisTextFieldState extends State<SollarisTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
            onSaved: widget.onSaved,
            obscureText: widget.isExibPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            keyboardType: widget.typeKey,
            inputFormatters: widget.inputFormatter,
            validator: widget.validator,
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: Colors.red),
              ),
              suffixIcon: widget.suffixIcon,
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
    );
  }
}
