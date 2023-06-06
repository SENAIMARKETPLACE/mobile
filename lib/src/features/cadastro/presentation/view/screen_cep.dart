import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_button.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_event.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_state.dart';
import 'package:cep/src/features/cadastro/presentation/view/screen_endereco.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_title.dart';
import 'package:cep/src/common/hive/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cep/src/dependency_assembly.dart' as di;

class ScreenCep extends StatefulWidget {
  const ScreenCep({super.key});

  @override
  State<ScreenCep> createState() => _ScreenCepState();
}

class _ScreenCepState extends State<ScreenCep> {
  final controllerCep = TextEditingController();
  final chave4 = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.dependency<RegisterCompanyBloc>(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Scaffold(
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
              ),
              body: BlocConsumer<RegisterCompanyBloc, RegisterCompanyState>(
                listener: (context, state) {
                  if (state.status == RegisterCompanyStatus.sucess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ScreenEndereco(address: state.address),
                        ));
                  } else if (state.status == RegisterCompanyStatus.error) {
                    log('Erro');
                  }
                },
                builder: (context, state) {
                  if (state.status == RegisterCompanyStatus.error) {
                    log('Erro');
                  }
                  return Container(
                    width: MediaQuery.of(context).size.height,
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
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Form(
                      key: chave4,
                      child: Column(
                        children: [
                          const SollarisTitle(
                            title: 'Onde a empresa está localizada',
                          ),
                          const SizedBox(height: 20),
                          SollarisTextField(
                            prefixIcon: Icons.location_city,
                            label: 'CEP',
                            hint: 'Informe o CEP',
                            controller: controllerCep,
                            onSaved: (value) => value != null
                                ? Register().saveCep(value)
                                : null,
                            validator: (p0) {
                              if (p0!.isEmpty ||
                                  controllerCep.text.length < 8) {
                                return 'Cep inválido. Digite novamente';
                              }
                              return null;
                            },
                            typeKey: TextInputType.number,
                            inputFormatter: [
                              CepInputFormatter(),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            suffixIcon: IconButton(
                              onPressed: () {
                                context.read<RegisterCompanyBloc>().add(
                                      GetCepEvent(
                                        cep: controllerCep.text,
                                      ),
                                    );
                              },
                              icon: const Icon(Icons.search),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Expanded(
                    child: SollarisTextButton(
                        textButton: 'Próximo',
                        function: () {
                          // if (formKey.currentState!.validate()) {
                          // } else {
                          //   log('ops');
                          // }
                        }),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
