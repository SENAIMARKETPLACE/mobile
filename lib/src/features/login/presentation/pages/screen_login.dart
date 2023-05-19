import 'package:cep/src/core/utils/app_routes.dart';
import 'package:cep/src/core/utils/sollaris_text_button.dart';
import 'package:cep/src/core/utils/sollaris_text_field.dart';
import 'package:cep/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:cep/src/features/login/presentation/bloc/login_state.dart';
import 'package:cep/src/dependency_assembly.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  ImageProvider img = const AssetImage('assets/image/logo.png');

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
        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 198, 146, 243),
                  Color.fromARGB(255, 167, 222, 222)
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: img,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromARGB(255, 86, 9, 153),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     context.read<LoginBloc>().add(
                      //           LoginAccessEvent(
                      //             credenciais: Login(
                      //               email: _controllerLogin.text,
                      //               password: _controllerSenha.text,
                      //             ),
                      //           ),
                      //         );
                      //   },
                      //   child: const Text('Login'),
                      // ),
                      controller: _controllerSenha),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SollarisTextButton(
                      textButton: 'Acessar',
                      function: () {},
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SollarisTextButton(
                        textButton: 'Cadastro', function: () {}),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
