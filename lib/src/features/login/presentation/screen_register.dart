import 'package:cep/src/core/utils/sollaris_text_field.dart';
import 'package:cep/src/core/utils/sollaris_title.dart';
import 'package:flutter/material.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SollarisTitle(
              title: 'Acesse',
            ),
            const SollarisTitle(title: "Use seu e-mail e senha para acessar"),
            const SizedBox(height: 20),
            SollarisTextField(
              label: 'E-mail',
              hint: 'Digite seu e-mail',
              controller: _controllerLogin,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'E-mail inválido. Digite novamente';
                }
                return null;
              },
            ),
            SollarisTextField(
              label: 'Senha',
              hint: 'Digite sua senha',
              controller: _controllerSenha,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Senha inválida. Digite novamente';
                }
                return null;
              },
            ),
            Row(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Login')),
              ),
              const SizedBox(
                width: 25,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
