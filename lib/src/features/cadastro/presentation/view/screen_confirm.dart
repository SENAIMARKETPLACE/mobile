import 'package:cep/src/common/hive/register.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_button.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_title.dart';
import 'package:cep/src/core/utils/app_routes.dart';
import 'package:cep/src/features/cadastro/domain/entities/address.dart';
import 'package:cep/src/features/cadastro/domain/entities/company.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_event.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_state.dart';
import 'package:cep/src/features/login/presentation/pages/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cep/src/dependency_assembly.dart' as di;

class ScreenConfirm extends StatefulWidget {
  const ScreenConfirm({super.key});

  @override
  State<ScreenConfirm> createState() => _ScreenConfirmState();
}

class _ScreenConfirmState extends State<ScreenConfirm> {
  List<String> data = [];
  int count = 0;
  var snackbarSucess = const SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
    ),
    content: Text(
      'Cadastro realizado com sucesso',
      style: TextStyle(
        fontSize: 15,
      ),
    ),
    backgroundColor: Colors.green,
  );
  var snackbarError = const SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
    ),
    content: Text(
      'Erro ao cadastrar. Tente novamente mais tarde.',
      style: TextStyle(
        fontSize: 15,
      ),
    ),
    backgroundColor: Colors.red,
  );

  Future<Map<String, String>> loadData() async {
    return await Register().loadDate();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void _showSnackbarPositive(String message) {
    final snackbar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

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
    return BlocProvider(
      create: (context) => di.dependency<RegisterCompanyBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 198, 146, 243),
                  Color.fromARGB(255, 198, 166, 243),
                ],
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 39, 77, 109),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((_) => count++ >= 5);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 39, 77, 109),
                ))
          ],
        ),
        body: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                Map map = snapshot.data ?? {};
                return Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 198, 146, 243),
                      Color.fromARGB(255, 167, 222, 222),
                    ],
                  )),
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SollarisTitle(title: 'Confirme os dados'),
                      const SizedBox(height: 20),
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ListTile(
                          title: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Text(
                              'Dados Iniciais',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(map['cnpj']),
                              Text(map['nomeFantasia']),
                              Text(map['razaoSocial']),
                              Text(map['responsavel']),
                              Text(map['email']),
                              Text(map['telefone']),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ListTile(
                          title: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Text(
                              'Endereço',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(map['cep']),
                              Text(map['rua']),
                              Text(map['numero']),
                              Text(map['bairro']),
                              Text(map['cidade']),
                              Text(map['estado']),
                              Text(map['compto']),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: BlocConsumer<RegisterCompanyBloc,
                              RegisterCompanyState>(
                            listener: (context, state) {
                              if (state.status ==
                                  RegisterCompanyStatus.sucess) {
                                _showSnackbarPositive(
                                    'Cadastro realizado com sucesso');
                                Future.delayed(const Duration(seconds: 5));
                                Navigator.of(context)
                                    .pushReplacementNamed(AppRoutes.login);
                              } else if (state.status ==
                                  RegisterCompanyStatus.error) {
                                _showSnackbar('Erro ao cadastrar!');
                              }
                            },
                            builder: (context, state) {
                              if (state.status ==
                                  RegisterCompanyStatus.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                // _showSnackbarPositive(
                                //     'Cadastrado realizado com sucesso');
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  width: double.infinity,
                                  height: 45,
                                  child: SollarisTextButton(
                                      textButton: 'Registrar',
                                      function: () {
                                        final company = Company(
                                          id: '',
                                          cnpj: map['cnpj'],
                                          email: map['email'],
                                          telefone: map['telefone'],
                                          senha: map['senha'],
                                          razaoSocial: map['razaoSocial'],
                                          nomeProprietario: map['responsavel'],
                                          nomeFantasia: map['nomeFantasia'],
                                          endereco: Address(
                                            cep: map['cep'],
                                            numero: map['numero'],
                                            estado: map['estado'],
                                            bairro: map['bairro'],
                                            cidade: map['cidade'],
                                            logradouro: map['rua'],
                                          ),
                                          logo: 'Minha Imagem',
                                        );

                                        final state = context
                                            .read<RegisterCompanyBloc>()
                                            .state;

                                        context.read<RegisterCompanyBloc>().add(
                                            SetCompanyEvent(company: company));

                                        if (state.status ==
                                            RegisterCompanyStatus.sucess) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackbarSucess);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ScreenLogin(),
                                            ),
                                          );
                                        } else if (state.status ==
                                            RegisterCompanyStatus.error) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackbarError);
                                        }
                                      }),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
