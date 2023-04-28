import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:cep/src/core/utils/sollaris_title.dart';
import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_event.dart';
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

  Future<Map<String, String>> loadData() async {
    return await LocalDataSource().loadDate();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.dependency<RegisterCompanyBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0XFF14C871),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((_) => count++ >= 5);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Color(0XFF14C871),
                ))
          ],
        ),
        body: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                Map map = snapshot.data ?? {};
                return Container(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SollarisTitle(title: 'Confirme os dados'),
                      const SizedBox(height: 20),
                      Card(
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
                              Text(map['email']),
                              Text(map['telefone']),
                            ],
                          ),
                        ),
                      ),
                      Card(
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            height: 45,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: const Color(0xff14C871),
                                padding: const EdgeInsets.only(
                                  left: 125,
                                  right: 125,
                                ),
                              ),
                              onPressed: () {
                                final company = Company(
                                  id: '',
                                  cnpj: map['cnpj'],
                                  email: map['email'],
                                  telefone: map['telefone'],
                                  senha: map['senha'],
                                  razaoSocial: map['razaoSocial'],
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

                                final state =
                                    context.read<RegisterCompanyBloc>().state;

                                context
                                    .read<RegisterCompanyBloc>()
                                    .add(SetCompanyEvent(company: company));
                              },
                              child: const Text(
                                'Registrar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
