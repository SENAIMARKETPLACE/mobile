import 'package:cep/src/core/utils/app_routes.dart';
import 'package:cep/src/core/utils/sollaris_text_field.dart';
import 'package:cep/src/core/utils/sollaris_title.dart';
import 'package:cep/src/features/cadastro/presentation/view/screen_cnpj.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:cep/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:cep/src/features/login/presentation/bloc/login_event.dart';
import 'package:cep/src/features/login/presentation/bloc/login_state.dart';
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
    return BlocProvider(
      create: (context) => di.dependency<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          } else if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) => Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                        context.read<LoginBloc>().add(
                              LoginAccessEvent(
                                credenciais: Login(
                                  email: _controllerLogin.text,
                                  password: _controllerSenha.text,
                                ),
                              ),
                            );
                      },
                      child: const Text('Login'),
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
