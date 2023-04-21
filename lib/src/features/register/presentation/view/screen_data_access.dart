import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenDataAcess extends StatelessWidget {
  const ScreenDataAcess({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controllerEmail = TextEditingController();
    final controllerPassoword = TextEditingController();
    final controllerRepeatPassword = TextEditingController();
    final controllerTelefone = TextEditingController();

    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 7, left: 10, right: 10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WidgetTitle(title: "Dados de Acesso"),
                  Container(
                    child: Column(
                      children: [
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
                          label: "Senha",
                          hint: "Digite sua senha",
                          controller: controllerPassoword,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Senha Inválida. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        WidgetTextFieldRegister(
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
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                  child: WidgetTextButton(keyButton: formKey,controller: ,)),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
