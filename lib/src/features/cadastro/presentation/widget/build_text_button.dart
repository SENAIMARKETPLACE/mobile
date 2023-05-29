// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class BuildTextButton extends StatefulWidget {
  const BuildTextButton({
    Key? key,
    required this.keyButton,
    required this.widget,
    this.textButton = 'Próximo',
  }) : super(key: key);

  final GlobalKey<FormState> keyButton;
  final Widget widget;
  final String textButton;

  @override
  State<BuildTextButton> createState() => _BuildTextButtonState();
}

class _BuildTextButtonState extends State<BuildTextButton> {
  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22))),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      content: Text('Verifique os campos e tente novamente'),
    );
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xff8F29C8),
          padding: const EdgeInsets.only(
            left: 125,
            right: 125,
          ),
        ),
        onPressed: () {
          if (widget.keyButton.currentState!.validate()) {
            widget.keyButton.currentState!.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => widget.widget,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Text(
          widget.textButton,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
