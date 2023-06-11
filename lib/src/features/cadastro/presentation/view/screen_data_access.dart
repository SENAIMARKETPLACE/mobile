import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/features/cadastro/presentation/view/screen_%20initial_info.dart';
import 'package:cep/src/features/cadastro/presentation/widget/build_form.dart';
import 'package:cep/src/features/cadastro/presentation/widget/build_text_button.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_title.dart';
import 'package:cep/src/common/hive/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ScreenDataAcess extends StatefulWidget {
  const ScreenDataAcess({super.key});

  @override
  State<ScreenDataAcess> createState() => _ScreenDataAcessState();
}

class _ScreenDataAcessState extends State<ScreenDataAcess> {
  final chave2 = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassoword = TextEditingController();
  final controllerRepeatPassword = TextEditingController();
  final controllerTelefone = TextEditingController();
  bool isExibe = true;

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return BuildForm(
      formKey: chave2,
      inputs: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SollarisTitle(title: "Dados de acesso"),
          const SizedBox(height: 20),
          SollarisTextField(
            onSaved: (value) {
              value != null ? Register().setEmail(value) : null;
            },
            label: "E-mail",
            hint: "email@example.com",
            controller: controllerEmail,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Campo inválido';
              }
              return null;
            },
            prefixIcon: Icons.mail,
            typeKey: TextInputType.emailAddress,
          ),
          SollarisTextField(
            typeKey: TextInputType.number,
            label: "Telefone",
            hint: "(99) 99999-9999",
            controller: controllerTelefone,
            prefixIcon: Icons.phone,
            onSaved: (value) =>
                value != null ? Register().setTelefone(value) : null,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Telefone Inválido. Digite novamente';
              }
              return null;
            },
            inputFormatter: [maskFormatter],
          ),
          SollarisTextField(
            isExibPassword: isExibe,
            prefixIcon: Icons.lock,
            label: "Senha",
            hint: "Digite sua senha",
            controller: controllerPassoword,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Senha Inválida. Digite novamente';
              }
              return null;
            },
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isExibe = !isExibe;
                });
              },
              icon: Icon(
                isExibe ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xff8F29C8),
              ),
            ),
          ),
          SollarisTextField(
            isExibPassword: isExibe,
            prefixIcon: Icons.lock,
            label: "Confirme sua senha",
            hint: "Repita sua senha",
            controller: controllerRepeatPassword,
            onSaved: (value) =>
                value != null ? Register().setSenha(value) : null,
            validator: (p0) {
              if (p0!.isEmpty ||
                  controllerRepeatPassword.text != controllerPassoword.text) {
                return 'Senha inválida. Digite novamente';
              }
              return null;
            },
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isExibe = !isExibe;
                });
              },
              icon: Icon(
                isExibe ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xff8F29C8),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BuildTextButton(
                keyButton: chave2,
                widget: const ScreenInitialInfo(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
