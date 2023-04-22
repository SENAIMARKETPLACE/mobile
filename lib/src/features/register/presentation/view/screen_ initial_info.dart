import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:cep/src/features/register/presentation/view/screen_cep.dart';
import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';
import 'package:flutter/material.dart';

class ScreenInitialInfo extends StatefulWidget {
  const ScreenInitialInfo({super.key});

  @override
  State<ScreenInitialInfo> createState() => _ScreenInitialInfoState();
}

class _ScreenInitialInfoState extends State<ScreenInitialInfo> {
  final chave3 = GlobalKey<FormState>();
  final controllerNomeFan = TextEditingController();
  final controllerRazaoSocial = TextEditingController();

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
              key: chave3,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WidgetTitle(
                      title: 'Informações Iniciais',
                    ),
                    const SizedBox(height: 20),
                    WidgetTextFieldRegister(
                      label: 'Nome fantasia',
                      hint: 'Digite o nome fantasia da empresa',
                      controller: controllerNomeFan,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Nome fantasia inválido';
                        }
                        return null;
                      },
                    ),
                    WidgetTextFieldRegister(
                      label: 'Razão social',
                      hint: 'Digite a razão social da empresa',
                      controller: controllerRazaoSocial,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Nome fantasia inválido';
                        }
                        return null;
                      },
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WidgetTextButton(
                          tipoSave: 3,
                          keyButton: chave3,
                          mapControllers: LocalDataSource().mapController(
                              razaoSocial: controllerRazaoSocial.text,
                              nomeFantasia: controllerNomeFan.text),
                          widget: const ScreenCep(),
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
