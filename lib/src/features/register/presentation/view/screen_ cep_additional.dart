import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';
import 'package:flutter/material.dart';

class ScreenLocation extends StatelessWidget {
  const ScreenLocation({super.key});

  @override
  Widget build(BuildContext context) {
    // final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color(0XFF14C871),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 7, left: 10, right: 10),
        child: Form(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WidgetTitle(title: "Complete os dados"),
                  Container(
                    child: Column(
                      children: [
                        const WidgetTextFieldRegister(
                          label: "Estado",
                          hint: "São Paulo",
                        ),
                        const WidgetTextFieldRegister(
                          label: "Cidade",
                          hint: "Itapecerica da Serra",
                        ),
                        const WidgetTextFieldRegister(
                          label: "Bairro",
                          hint: "Parque Paraíso",
                        ),
                        const WidgetTextFieldRegister(
                          label: "Rua",
                          hint: "XV de Novembro",
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: WidgetTextFieldRegister(
                                label: "Número",
                                hint: "N°",
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 3,
                              child: WidgetTextFieldRegister(
                                label: "Complemento",
                                hint: "Informe o complemento",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: WidgetTextButton(action: () {})),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
