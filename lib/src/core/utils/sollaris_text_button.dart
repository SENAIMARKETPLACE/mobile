// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SollarisTextButton extends StatelessWidget {
  const SollarisTextButton({
    Key? key,
    required this.textButton,
    required this.function,
  }) : super(key: key);

  final String textButton;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xff8F29C8),
          
          // padding: const EdgeInsets.only(
          //   left: 125,
          //   right: 125,
          // ),
        ),
        onPressed: function,
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
