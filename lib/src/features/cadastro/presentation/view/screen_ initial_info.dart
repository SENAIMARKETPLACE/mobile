import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_title.dart';
import 'package:cep/src/features/cadastro/presentation/view/screen_cep.dart';
import 'package:cep/src/features/cadastro/presentation/widget/build_form.dart';
import 'package:cep/src/features/cadastro/presentation/widget/build_text_button.dart';

import 'package:cep/src/common/hive/register.dart';
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
  final controllerResponsavel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BuildForm(
      formKey: chave3,
      inputs: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SollarisTitle(
            title: 'Informações Iniciais',
          ),
          const SizedBox(height: 20),
          SollarisTextField(
            prefixIcon: Icons.domain_disabled,
            label: 'Razão social',
            hint: 'Digite a razão social da empresa',
            controller: controllerRazaoSocial,
            onSaved: (value) =>
                value != null ? Register().setRazaoSocial(value) : null,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Nome fantasia inválido';
              }
              return null;
            },
          ),
          SollarisTextField(
            label: 'Nome fantasia',
            prefixIcon: Icons.domain_disabled,
            hint: 'Digite o nome fantasia da empresa',
            controller: controllerNomeFan,
            onSaved: (value) =>
                value != null ? Register().setNomeFantasia(value) : null,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Nome fantasia inválido';
              }
              return null;
            },
          ),
          SollarisTextField(
            label: 'Nome Responsável',
            prefixIcon: Icons.domain_disabled,
            hint: 'Digite o nome do responsável',
            controller: controllerResponsavel,
            onSaved: (value) =>
                value != null ? Register().setResponsavel(value) : null,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Nome do Responsável inválido';
              }
              return null;
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BuildTextButton(
                keyButton: chave3,
                widget: const ScreenCep(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
