// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/src/features/register/domain/entities/company.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_event.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_state.dart';
import 'package:cep/src/features/register/presentation/view/sucess.dart';
import 'package:cep/src/features/register/presentation/widget/build_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/features/register/domain/entities/address.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  bool isObscured = true;
  bool isObscured2 = true;
  IconData iconPassword = Icons.visibility;
  IconData iconPassword2 = Icons.visibility;
  // final bloc = di.dependency<RegisterCompanyBloc>();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final _controllerCnpj = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  final _controllerRepSenha = TextEditingController();
  final _controllerTelefone = TextEditingController();
  final _controllerProp = TextEditingController();
  final _controllerFant = TextEditingController();
  final _controllerRaz = TextEditingController();

  final _controllerCep = TextEditingController();
  final _controllerLog = TextEditingController();
  final _controllerBairro = TextEditingController();
  final _controllerCid = TextEditingController();
  final _controllerEst = TextEditingController();
  final _controllerNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stepper(
        type: StepperType.vertical,
        currentStep: _activeStepIndex,
        steps: stepList(_activeStepIndex, widget.entity),
        onStepTapped: (value) => tapped(value),
        onStepContinue: continued,
        onStepCancel: cancel,
        controlsBuilder: (context, details) {
          if (_activeStepIndex != 4) {
            return Row(
              children: <Widget>[
                TextButton(
                  onPressed: details.onStepContinue,
                  child: const Text('Avançar'),
                ),
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('Voltar'),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  tapped(int step) {
    setState(() => _activeStepIndex = step);
  }

  continued() {
    switch (_activeStepIndex) {
      case 0:
        if (formKeys[0].currentState!.validate()) {
          _activeStepIndex < 4 ? setState(() => _activeStepIndex++) : null;
        }
        break;
      case 1:
        if (formKeys[1].currentState!.validate()) {
          _activeStepIndex < 4 ? setState(() => _activeStepIndex++) : null;
        }
        break;
      case 2:
        _activeStepIndex < 4 ? setState(() => _activeStepIndex++) : null;
        break;
      case 3:
        if (formKeys[2].currentState!.validate()) {
          _activeStepIndex < 4 ? setState(() => _activeStepIndex++) : null;
        }
        break;
      case 4:
        if (formKeys[3].currentState!.validate()) {
          _activeStepIndex < 4 ? setState(() => _activeStepIndex++) : null;
        }
        break;
    }
  }

  cancel() {
    _activeStepIndex > 0 ? setState(() => _activeStepIndex -= 1) : null;
  }

  List<Step> stepList(int currentStep, Address address) {
    final text = TextEditingController();
    _controllerLog.text = address.logradouro;
    _controllerBairro.text = address.bairro;
    _controllerCid.text = address.cidade;
    _controllerEst.text = address.estado;

    return [
      Step(
        title: const Text('CNPJ'),
        content: Form(
          key: formKeys[0],
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: BuildField(
                  keyboard: TextInputType.number,
                  controller: _controllerCnpj,
                  hintText: 'Informe o CNPJ',
                  formatter: [
                    CnpjInputFormatter(),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty || value.length < 14) {
                      return 'Cnpj inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text('DADOS DA EMPRESA'),
        content: Form(
          key: formKeys[1],
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildField(
                  keyboard: TextInputType.text,
                  controller: _controllerProp,
                  hintText: 'Informe o nome do proprietário',
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Nome inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
                BuildField(
                  keyboard: TextInputType.text,
                  controller: _controllerFant,
                  hintText: 'Informe o nome fantasia',
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Nome fantasia inválida. Digite novamente.';
                    }
                    return null;
                  },
                ),
                BuildField(
                  keyboard: TextInputType.text,
                  controller: _controllerRaz,
                  hintText: 'Informe a razão social',
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Razão Social inválida. Digite novamente.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep > 1 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text('FOTO'),
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
        state: currentStep > 2 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text('DADOS DE ACESSO'),
        content: Form(
          key: formKeys[2],
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildField(
                  prefixIcon: const Icon(Icons.email),
                  controller: _controllerEmail,
                  hintText: 'Informe o email',
                  keyboard: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'E-mail inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
                BuildField(
                  controller: _controllerSenha,
                  hintText: 'Informe a senha',
                  keyboard: TextInputType.text,
                  isObscure: isObscured,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (isObscured) {
                          setState(() {
                            isObscured = false;
                            iconPassword = Icons.visibility_off;
                          });
                        } else {
                          setState(() {
                            isObscured = true;
                            iconPassword = Icons.visibility;
                          });
                        }
                      },
                      icon: Icon(iconPassword)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Senha Inválida. Digite novamente.';
                    }
                    return null;
                  },
                ),
                BuildField(
                  controller: _controllerRepSenha,
                  hintText: 'Repita a senha',
                  keyboard: TextInputType.text,
                  isObscure: isObscured2,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (isObscured2) {
                        setState(() {
                          isObscured2 = false;
                          iconPassword2 = Icons.visibility_off;
                        });
                      } else {
                        setState(() {
                          isObscured2 = true;
                          iconPassword2 = Icons.visibility;
                        });
                      }
                    },
                    icon: Icon(
                      iconPassword2,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value != _controllerSenha.text) {
                      return 'Senha Inválida. Digite novamente.';
                    }
                    return null;
                  },
                ),
                BuildField(
                  controller: _controllerTelefone,
                  hintText: 'Informe o telefone',
                  keyboard: TextInputType.number,
                  prefixIcon: const Icon(Icons.phone),
                  formatter: [
                    TelefoneInputFormatter(),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Telefone inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep > 3 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text('ENDEREÇO'),
        content: BlocBuilder<RegisterCompanyBloc, RegisterCompanyState>(
          builder: (context, state) {
            return Form(
              key: formKeys[3],
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildField(
                      controller: _controllerCep,
                      prefixIcon: const Icon(FontAwesomeIcons.locationDot),
                      hintText: 'Informe o Cep',
                      keyboard: TextInputType.number,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          context.read<RegisterCompanyBloc>().add(
                                GetCepEvent(
                                  cep: _controllerCep.text,
                                ),
                              );
                        },
                        icon: const Icon(Icons.search),
                      ),
                      formatter: [
                        CepInputFormatter(),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cep inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    BuildField(
                      controller: _controllerLog,
                      hintText: 'Ex.: Rua, Avenida, Viaduto',
                      keyboard: TextInputType.text,
                      prefixIcon: const Icon(FontAwesomeIcons.road),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Logradouro inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    BuildField(
                      controller: _controllerNum,
                      hintText: 'Informe o número',
                      keyboard: TextInputType.number,
                      prefixIcon: const Icon(FontAwesomeIcons.house),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo vázio. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    BuildField(
                      controller: _controllerBairro,
                      hintText: 'Informe o bairro',
                      keyboard: TextInputType.text,
                      prefixIcon: const Icon(FontAwesomeIcons.house),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bairro inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    BuildField(
                      controller: _controllerCid,
                      hintText: 'Informe a cidade',
                      keyboard: TextInputType.text,
                      prefixIcon: const Icon(FontAwesomeIcons.city),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cidade inválida. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    BuildField(
                      controller: _controllerEst,
                      hintText: 'Informe o estado',
                      isRead: true,
                      keyboard: TextInputType.text,
                      prefixIcon: const Icon(FontAwesomeIcons.city),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Estado inválido. Digite novamente.';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKeys[3].currentState!.validate()) {
                            final state =
                                context.read<RegisterCompanyBloc>().state;

                            if (state.status == RegisterCompanyStatus.sucess) {
                              context
                                  .read<RegisterCompanyBloc>()
                                  .add(SetCompanyEvent(
                                    company: Company(
                                        id: '',

                                        // nomeProprietario: _controllerProp.text,
                                        razaoSocial: _controllerRaz.text,
                                        cnpj: _controllerCnpj.text,
                                        telefone: _controllerTelefone.text,
                                        email: _controllerEmail.text,
                                        senha: _controllerSenha.text,
                                        nomeFantasia: _controllerFant.text,
                                        // logo: widget.foto.toString(),
                                        endereco: [
                                          Address(
                                            id: '',
                                            cep: _controllerCep.text,
                                            numero: _controllerNum.text,
                                            estado: _controllerEst.text,
                                            bairro: _controllerBairro.text,
                                            cidade: _controllerCid.text,
                                            logradouro: _controllerLog.text,
                                          ),
                                        ]),
                                  ));
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) {
                                  return const Sucess();
                                },
                              ));
                            }
                          }
                        },
                        child: const Text('Salvar')),
                  ],
                ),
              ),
            );
          },
        ),
        isActive: currentStep >= 0,
        state: currentStep > 4 ? StepState.complete : StepState.disabled,
      ),
    ];
  }
}
