import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class SollarisTextField extends StatefulWidget {
  SollarisTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
    this.inputFormatter,
    this.typeKey,
    this.suffixIcon,
    this.prefixIcon,
    this.isReadOnly = false,
    this.onTap,
    this.isExibPassword = false,
    this.onSaved,
    this.alignText = TextAlign.start,
    this.maxLength,
    this.suffixText,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  TextInputType? typeKey;
  List<TextInputFormatter>? inputFormatter;
  String? Function(String?) validator;
  void Function(String?)? onSaved;
  Widget? suffixIcon;
  IconData? prefixIcon;
  bool isExibPassword;
  bool isReadOnly;
  VoidCallback? onTap;
  TextAlign alignText;
  int? maxLength;
  String? suffixText;

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
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 65, 12, 96)),
          ),
          const SizedBox(height: 7),
          TextFormField(
            maxLength: widget.maxLength,
            onSaved: widget.onSaved,
            obscureText: widget.isExibPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            keyboardType: widget.typeKey,
            inputFormatters: widget.inputFormatter,
            validator: widget.validator,
            readOnly: widget.isReadOnly,
            onTap: widget.onTap,
            textAlign: widget.alignText,
            decoration: InputDecoration(
              suffixText: widget.suffixText,
              hintStyle: const TextStyle(fontSize: 18),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                borderSide: BorderSide(color: Colors.red),
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: const Color(0xff8F29C8),
                    )
                  : null,
              suffixIcon: widget.suffixIcon,
              filled: true,
              fillColor: const Color.fromARGB(223, 225, 223, 223),
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
