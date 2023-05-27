import 'package:cep/src/core/utils/app_routes.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_title.dart';
import 'package:cep/src/features/cadastro/presentation/view/screen_cnpj.dart';
import 'package:cep/src/features/login/domain/entities/login.dart';
import 'package:cep/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:cep/src/features/login/presentation/bloc/login_event.dart';
import 'package:cep/src/features/login/presentation/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cep/src/dependency_assembly.dart' as di;

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerSenha = TextEditingController();
  bool isLoading = false;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SollarisTitle(
                  title: 'Acesse',
                ),
                const SollarisTitle(
                    title: "Use seu e-mail e senha para acessar"),
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
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenCnpj()));
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
