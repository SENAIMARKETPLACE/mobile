import 'package:cep/src/core/presentation/widgets/sollaris_text_button.dart';
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
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ImageProvider img = const AssetImage('assets/image/logo.png');

  bool isExibe = true;

  void _showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(25),
          width: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 198, 146, 243),
              Color.fromARGB(255, 167, 222, 222)
            ],
          )),
          child: SizedBox(
            height: 800,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: BlocProvider(
                  create: (context) => di.dependency<LoginBloc>(),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 200),
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
                      const SizedBox(
                        height: 40,
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
                          prefixIcon: Icons.alternate_email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Valor inválido, digite novamente';
                            }
                            return null;
                          },
                          controller: _controllerEmail),
                      SollarisTextField(
                        prefixIcon: Icons.lock,
                        isExibPassword: isExibe,
                        label: 'Senha',
                        hint: 'Informe sua senha',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Valor inválido, digite novamente';
                          }
                          return null;
                        },
                        controller: _controllerSenha,
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
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 40,
                        // width: double.infinity,
                        child: BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state.status == LoginStatus.success) {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.home);
                            } else if (state.status == LoginStatus.failure) {
                              _showSnackbar('Email e Senha inválidos!');
                            }
                          },
                          builder: (context, state) {
                            if (state.status == LoginStatus.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Row(
                              children: [
                                Expanded(
                                  child: SollarisTextButton(
                                    textButton: 'Acessar',
                                    function: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(
                                              LoginAccessEvent(
                                                credenciais: Login(
                                                  email: _controllerEmail.text,
                                                  password:
                                                      _controllerSenha.text,
                                                ),
                                              ),
                                            );
                                      } else {
                                        _showSnackbar(
                                            'Verifique os campos e tente novamente');
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: SollarisTextButton(
                                    textButton: 'Cadastro',
                                    function: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ScreenCnpj(),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
