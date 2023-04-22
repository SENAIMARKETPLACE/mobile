import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:cep/src/features/register/presentation/view/screen_data_access.dart';
import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenCnpj extends StatefulWidget {
  const ScreenCnpj({super.key});

  @override
  State<ScreenCnpj> createState() => _ScreenCnpjState();
}

class _ScreenCnpjState extends State<ScreenCnpj> {
  final chave1 = GlobalKey<FormState>();
  final TextEditingController controllerCNPJ = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Color(0XFF14C871),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WidgetTitle(
                title: 'Informe o CNPJ de sua empresa',
              ),
              const SizedBox(height: 20),
              Form(
                key: chave1,
                child: WidgetTextFieldRegister(
                  typeKey: TextInputType.number,
                  controller: controllerCNPJ,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'CNPJ inválido. Digite novamente';
                    }
                    return null;
                  },
                  inputFormatter: [
                    CnpjInputFormatter(),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  label: 'CNPJ',
                  hint: 'Informe o CNPJ',
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: WidgetTextButton(
                    tipoSave: 1,
                    keyButton: chave1,
                    mapControllers: LocalDataSource()
                        .mapController(cnpj: controllerCNPJ.text),
                    widget: const ScreenDataAcess(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
