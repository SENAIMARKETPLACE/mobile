import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:cep/src/features/register/presentation/view/screen_%20initial_info.dart';
import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenDataAcess extends StatefulWidget {
  const ScreenDataAcess({super.key});

  @override
  State<ScreenDataAcess> createState() => _ScreenDataAcessState();
}

class _ScreenDataAcessState extends State<ScreenDataAcess> {
  final chave2 = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassoword = TextEditingController();
  final controllerRepeatPassword = TextEditingController();
  final controllerTelefone = TextEditingController();
  bool isExibe = false;

  // @override
  // void initState() {
  //   isExibe = true;
  //   super.initState();
  // }

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
              key: chave2,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WidgetTitle(title: "Dados de acesso"),
                    const SizedBox(height: 20),
                    WidgetTextFieldRegister(
                      label: "E-mail",
                      hint: "email@example.com",
                      controller: controllerEmail,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Campo inválido';
                        }
                        return null;
                      },
                      typeKey: TextInputType.emailAddress,
                    ),
                    WidgetTextFieldRegister(
                      typeKey: TextInputType.number,
                      label: "Telefone",
                      hint: "(99) 99999-9999",
                      controller: controllerTelefone,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Telefone Inválido. Digite novamente';
                        }
                        return null;
                      },
                      inputFormatter: [
                        TelefoneInputFormatter(),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    WidgetTextFieldRegister(
                        isExibPassword: isExibe,
                        label: "Senha",
                        hint: "Digite sua senha",
                        controller: controllerPassoword,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'Senha Inválida. Digite novamente';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isExibe = !isExibe;
                              });
                            },
                            icon: Icon(isExibe
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    WidgetTextFieldRegister(
                        isExibPassword: isExibe,
                        label: "Confirme sua senha",
                        hint: "Repita sua senha",
                        controller: controllerRepeatPassword,
                        validator: (p0) {
                          if (p0!.isEmpty ||
                              controllerRepeatPassword.text !=
                                  controllerPassoword.text) {
                            return 'Senha inválida. Digite novamente';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isExibe = !isExibe;
                              });
                            },
                            icon: Icon(isExibe
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WidgetTextButton(
                          tipoSave: 2,
                          keyButton: chave2,
                          mapControllers: LocalDataSource().mapController(
                            email: controllerEmail.text,
                            senha: controllerRepeatPassword.text,
                            telefone: controllerTelefone.text,
                          ),
                          widget: const ScreenInitialInfo(),
                        ),
                      ),
                    ),
                    // const Align(
                    //   alignment: Alignment.bottomCenter,
                    // child: WidgetTextButton(keyButton: formKey,controller: ,)),
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
