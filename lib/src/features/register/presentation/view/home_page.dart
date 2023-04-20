import 'package:brasil_fields/brasil_fields.dart';
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
  @override
  Widget build(BuildContext context) {
    final chave = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();

    return Scaffold(
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
          children: [
            const WidgetTitle(
              title: 'Informe o CNPJ de sua empresa',
            ),
            const SizedBox(height: 20),
            WidgetTextFieldRegister(
              keyButton: chave,
              controller: controller,
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
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: WidgetTextButton(keyButton: chave)),
            ),
          ],
        ),
      ),
    );
  }
}
