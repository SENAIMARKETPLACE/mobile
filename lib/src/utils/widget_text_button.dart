// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cep/src/core/datasources/local_datasource.dart';

class WidgetTextButton extends StatefulWidget {
  const WidgetTextButton({
    Key? key,
    required this.keyButton,
    required this.mapControllers,
    required this.widget,
    required this.tipoSave,
    this.textButton = 'Próximo',
  }) : super(key: key);

  final GlobalKey<FormState> keyButton;
  final Map<String, String> mapControllers;
  final Widget widget;
  final int tipoSave;
  final String textButton;

  @override
  State<WidgetTextButton> createState() => _WidgetTextButtonState();
}

class _WidgetTextButtonState extends State<WidgetTextButton> {
  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
      content: Text('Campo Inválido'),
    );
    return SizedBox(
      width: double.infinity,
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
          if (widget.keyButton.currentState!.validate()) {
            switch (widget.tipoSave) {
              case 1:
                LocalDataSource().setCnpj(widget.mapControllers);

                break;
              case 2:
                LocalDataSource().saveDataAccess(widget.mapControllers);

                break;
              case 3:
                LocalDataSource().saveInfoInitial(widget.mapControllers);

                break;
              case 4:
                LocalDataSource().saveCep(widget.mapControllers);
                break;
              case 5:
                LocalDataSource().saveLocalization(widget.mapControllers);
                break;
            }
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
