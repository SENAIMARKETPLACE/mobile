// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/presentation/view/screen_ready.dart';
import 'package:flutter/material.dart';

import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';

class ScreenEndereco extends StatefulWidget {
  const ScreenEndereco({
    Key? key,
    required this.address,
  }) : super(key: key);

  final Address address;

  @override
  State<ScreenEndereco> createState() => _ScreenEnderecoState();
}

class _ScreenEnderecoState extends State<ScreenEndereco> {
  final chave5 = GlobalKey<FormState>();
  final controllerRua = TextEditingController();
  final controllerBairro = TextEditingController();
  final controllerNumero = TextEditingController();
  final controllerCidade = TextEditingController();
  final controllerEstado = TextEditingController();
  final controllerCompl = TextEditingController();

  @override
  void initState() {
    controllerRua.text = widget.address.logradouro;
    controllerBairro.text = widget.address.bairro;
    controllerCidade.text = widget.address.cidade;
    controllerEstado.text = widget.address.estado;
    super.initState();
  }

  @override
  void dispose() {
    // controllerRua.dispose();
    // controllerBairro.dispose();
    // controllerCidade.dispose();
    // controllerEstado.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        body: Container(
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Form(
              key: chave5,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WidgetTitle(title: "Complete os dados"),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        WidgetTextFieldRegister(
                          label: "Rua",
                          hint: "Digite o nome da rua",
                          controller: controllerRua,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Rua inválida. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        WidgetTextFieldRegister(
                          label: "Bairro",
                          hint: "Digite o nome do bairro",
                          controller: controllerBairro,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Bairro inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        WidgetTextFieldRegister(
                          label: "Número",
                          hint: "Digite o número",
                          controller: controllerNumero,
                          typeKey: TextInputType.number,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Número inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        WidgetTextFieldRegister(
                          label: "Complemento",
                          hint: "Digite o complemento",
                          controller: controllerCompl,
                          validator: (_) {
                            return null;
                          },
                        ),
                        WidgetTextFieldRegister(
                          label: "Cidade",
                          hint: "Digite a cidade",
                          controller: controllerCidade,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Cidade inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        WidgetTextFieldRegister(
                          label: "Estado",
                          hint: "Digite o estado",
                          controller: controllerEstado,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Cidade inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WidgetTextButton(
                          tipoSave: 5,
                          keyButton: chave5,
                          mapControllers: LocalDataSource().mapController(
                            rua: controllerRua.text,
                            bairro: controllerBairro.text,
                            numero: controllerNumero.text,
                            cidade: controllerCidade.text,
                            estado: controllerEstado.text,
                            compto: controllerCompl.text,
                          ),
                          widget: const ScreenReady(),
                          textButton: 'Cadastrar',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
