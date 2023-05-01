import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_event.dart';
import 'package:cep/src/features/cadastro/presentation/bloc/register_company_state.dart';
import 'package:cep/src/features/cadastro/presentation/view/screen_endereco.dart';
import 'package:cep/src/core/utils/sollaris_text_field.dart';
import 'package:cep/src/core/utils/sollaris_title.dart';
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
          ),
          body: BlocConsumer<RegisterCompanyBloc, RegisterCompanyState>(
            listener: (context, state) {
              if (state.status == RegisterCompanyStatus.sucess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ScreenEndereco(address: state.address),
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
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Form(
                  key: chave4,
                  child: Column(
                    children: [
                      const SollarisTitle(
                        title: 'Onde a empresa está localizada',
                      ),
                      const SizedBox(height: 20),
                      SollarisTextField(
                        label: 'CEP',
                        hint: 'Informe o CEP',
                        controller: controllerCep,
                        onSaved: (value) =>
                            value != null ? Register().saveCep(value) : null,
                        validator: (p0) {
                          if (p0!.isEmpty || controllerCep.text.length < 8) {
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
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
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
                                if (chave4.currentState!.validate()) {
                                  chave4.currentState!.save();
                                  context.read<RegisterCompanyBloc>().add(
                                        GetCepEvent(
                                          cep: controllerCep.text,
                                        ),
                                      );
                                }
                              },
                              child: const Text(
                                'Próximo',
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
