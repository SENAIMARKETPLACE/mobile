import 'package:cep/src/core/utils/sollaris_text_button.dart';
import 'package:cep/src/core/utils/sollaris_title.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/sollaris_text_field.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  bool isExibe = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // height: MediaQuery.of(context.size.height),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 171, 122, 214),
              Color.fromARGB(255, 78, 232, 232)
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.all(15),
            // child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/image/logo.png',
                  width: 110,
                  height: 110,
                ),
                const SollarisTitle(title: 'Login'),
                const SizedBox(height: 20),
                SollarisTextField(
                    label: 'E-mail',
                    hint: 'Informe seu e-mail',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Valor inválido, digite novamente';
                      }
                      return null;
                    },
                    controller: _controllerEmail),
                SollarisTextField(
                    isExibPassword: isExibe,
                    label: 'Senha',
                    hint: 'Informe sua Senha',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Valor inválido, digite novamente';
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
                          isExibe ? Icons.visibility : Icons.visibility_off),
                    ),
                    controller: _controllerSenha),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SollarisTextButton(
                      textButton: 'Acessar', function: () {}),
                )),
                // Expanded(
                //   child: Align(
                //   alignment: Alignment.bottomCenter,
                //   child: SollarisTextButton(
                //       textButton: 'Cadastro', function: () {}),
                // )),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
