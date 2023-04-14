import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';
import 'package:flutter/material.dart';

class ScreenInitialInfo extends StatelessWidget {
  const ScreenInitialInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const WidgetTitle(title: "Informações Iniciais"),
                    Container(
                      child: Column(
                        children: const [
                          WidgetTextFieldRegister(
                            label: "Nome Fantasia",
                            hint: "Digite o nome fantasia da empresa",
                          ),
                          WidgetTextFieldRegister(
                            label: "Razão Social",
                            hint: "Digite a Razão Social da empresa",
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: WidgetTextButton(
                          action: () {},
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
