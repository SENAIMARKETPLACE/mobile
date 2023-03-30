// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/register/presentation/bloc/register_company_state.dart';
import 'package:cep/src/features/register/presentation/widget/build_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_event.dart';

class BuildSteps extends StatefulWidget {
  const BuildSteps({
    Key? key,
    required this.galeria,
    required this.foto,
    required this.entity,
  }) : super(key: key);

  final Function() galeria;
  final ImageProvider foto;
  final Address entity;

  @override
  State<BuildSteps> createState() => _BuildStepsState();
}

class _BuildStepsState extends State<BuildSteps> {
  int _activeStepIndex = 0;
  // final bloc = di.dependency<RegisterCompanyBloc>();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final _controllerCnpj = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      
      type: StepperType.vertical,
      currentStep: _activeStepIndex,
      steps: stepList(_activeStepIndex, widget.entity),
      onStepTapped: (value) => tapped(value),
      onStepContinue: continued,
      onStepCancel: cancel,
      controlsBuilder: (context, details) => Row(
        children: <Widget>[
          TextButton(
            onPressed: details.onStepContinue,
            child: _activeStepIndex == 2
                ? const Text('Pular')
                : const Text('Avançar'),
          ),
          TextButton(
            onPressed: details.onStepCancel,
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }

  tapped(int step) {
    setState(() => _activeStepIndex = step);
  }

  continued() {
    switch (_activeStepIndex) {
      case 0:
        if (formKeys[0].currentState!.validate()) {
          _activeStepIndex < 3 ? setState(() => _activeStepIndex++) : null;
        }
        break;
      case 1:
        if (formKeys[1].currentState!.validate()) {
          _activeStepIndex < 3 ? setState(() => _activeStepIndex++) : null;
        }
        break;
      case 2:
        _activeStepIndex < 3 ? setState(() => _activeStepIndex++) : null;
        break;
      case 3:
        if (formKeys[2].currentState!.validate()) {
          _activeStepIndex < 3 ? setState(() => _activeStepIndex++) : null;
        }
        break;
    }
  }

  cancel() {
    _activeStepIndex > 0 ? setState(() => _activeStepIndex -= 1) : null;
  }

  List<Step> stepList(int currentStep, Address address) {
    final text = TextEditingController();
    text.text = address.logradouro;

    return [
      Step(
        title: const Text('CNPJ'),
        label: const Icon(Icons.apartment),

        content: Form(
          key: formKeys[0],
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: BuildField(
                  keyboard: TextInputType.number,
                  controller: _controllerCnpj,
                  hintText: 'Ex.: Rua, Avenida, Viaduto',
                  labelText: 'Digite o CNPJ',
                ),
              ),
            ],
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text('Dados de acesso'),
        content: Form(
          key: formKeys[1],
          child: SizedBox(
            // padding: const EdgeInsets.symmetric(vertical: 6),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    hintText: 'Informe o e-mail',
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Informe o senha',
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      fillColor: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Informe a senha novamente',
                      labelText: 'Repita a senha',
                      border: OutlineInputBorder(),
                      fillColor: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Informe o telefone',
                      labelText: 'Telefone',
                      border: OutlineInputBorder(),
                      fillColor: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep >= 1 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text('Foto'),
        content: GestureDetector(
          onTap: widget.galeria,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              image: DecorationImage(image: widget.foto),
            ),
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep >= 2 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text('Endereço'),
        content: BlocBuilder<RegisterCompanyBloc, RegisterCompanyState>(
          builder: (context, state) {
            return Form(
              key: formKeys[2],
              child: SizedBox(
                // padding: const EdgeInsets.symmetric(vertical: 6),
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(state.endereco.logradouro),
                    TextFormField(
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            context
                                .read<RegisterCompanyBloc>()
                                .add(const GetCepEvent(cep: '06693220'));
                          },
                          icon: const Icon(Icons.search),
                        ),
                        hintText: 'Informe o cep',
                        labelText: 'Cep',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (valuee) {
                        if (valuee!.isEmpty) {
                          return 'Campo Inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          hintText: 'Ex.: Rua, Avenida, Viaduto',
                          labelText: 'Logradouro',
                          border: OutlineInputBorder(),
                          fillColor: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          hintText: 'Informe o bairro',
                          labelText: 'Bairro',
                          border: OutlineInputBorder(),
                          fillColor: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          hintText: 'Informe a cidade',
                          labelText: 'Cidade',
                          border: OutlineInputBorder(),
                          fillColor: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          hintText: 'Informe a estado',
                          labelText: 'Estado',
                          border: OutlineInputBorder(),
                          fillColor: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        isActive: currentStep >= 0,
        state: currentStep >= 3 ? StepState.complete : StepState.disabled,
      ),
    ];
  }
}
