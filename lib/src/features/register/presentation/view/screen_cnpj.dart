import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:cep/src/features/register/presentation/view/screen_data_access.dart';
import 'package:cep/src/features/register/presentation/widget/build_form.dart';
import 'package:cep/src/features/register/presentation/widget/build_text_button.dart';
import 'package:cep/src/core/utils/sollaris_text_field.dart';
import 'package:cep/src/core/utils/sollaris_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenCnpj extends StatelessWidget {
  ScreenCnpj({super.key});

  final chave1 = GlobalKey<FormState>();
  final TextEditingController controllerCNPJ = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BuildForm(
      formKey: chave1,
      inputs: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SollarisTitle(
            title: 'Informe o CNPJ de sua empresa',
          ),
          const SizedBox(height: 20),
          SollarisTextField(
            onSaved: (value) {
              value != null ? LocalDataSource().setCnpj(value) : null;
            },
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
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BuildTextButton(
                keyButton: chave1,
                widget: const ScreenDataAcess(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
