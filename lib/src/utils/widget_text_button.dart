import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:flutter/material.dart';

class WidgetTextButton extends StatelessWidget {
  const WidgetTextButton(
      {super.key,
      required this.keyButton,
      required this.controller,
      required this.widget});

  final GlobalKey<FormState> keyButton;
  final String controller;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xff14C871),
          padding: const EdgeInsets.only(
            left: 125,
            right: 125,
          ),
        ),
        onPressed: () {
          if (keyButton.currentState!.validate()) {
            LocalDataSource().setString(controller);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget,
            ));
          } else {
            print('Não passou');
          }
        },
        child: const Text(
          'Próximo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
