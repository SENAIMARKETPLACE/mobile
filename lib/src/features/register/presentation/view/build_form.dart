import 'dart:io';

import 'package:cep/src/dependency_assembly.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Company'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const BuildForm(),
              ));
            },
            child: const Text('Cadastrar')),
      ),
    );
  }
}

class BuildForm extends StatefulWidget {
  const BuildForm({super.key});

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final _controller = TextEditingController();
  bool isImage = false;
  File? imageSele;

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  ImageProvider imageSelected = const AssetImage('assets/image/man.png');

  bool isLoading = false;
  final bloc = dependency<RegisterCompanyBloc>();

  int _activeStepIndex = 0;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   bloc.add(const GetCepEvent(cep: '06693220'));
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCompanyBloc, RegisterCompanyState>(
        bloc: bloc,
        builder: (context, state) {
          isLoading = state.isLoading;

          switch (state.status) {
            case RegisterCompanyStatus.initial:
            case RegisterCompanyStatus.loading:
            // return const Text('Loading');
            case RegisterCompanyStatus.sucess:
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Register Company'),
                  centerTitle: true,
                ),
                body: Stepper(
                  type: StepperType.vertical,
                  currentStep: _activeStepIndex,
                  steps: stepList(_activeStepIndex),
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
                ),
              );
            case RegisterCompanyStatus.error:
              return Scaffold(
                body: Center(
                  child: Text(state.message),
                ),
              );
          }
        });
  }

  tapped(int step) {
    setState(() => _activeStepIndex = step);
  }

  continued() {
    if (formKeys[_activeStepIndex].currentState!.validate()) {
      _activeStepIndex < 2 ? setState(() => _activeStepIndex++) : null;
    }
  }

  cancel() {
    _activeStepIndex > 0 ? setState(() => _activeStepIndex -= 1) : null;
  }

  Future<void> _onGallery() async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1800,
      maxWidth: 1800,
    );

    if (image != null) {
      final imageTemp = File(image.path);

      setState(() {
        imageSelected = FileImage(File(image.path));
        isImage = true;
      });
    }
  }

  List<Step> stepList(int currentStep) {
    return [
      Step(
        title: const Text('CNPJ'),
        content: Form(
          key: formKeys[0],
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Informe o CNPJ',
                      labelText: 'CNPJ',
                      border: OutlineInputBorder(),
                      fillColor: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Inválido. Digite novamente.';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep >= 0 ? StepState.complete : StepState.disabled,
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
          onTap: _onGallery,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              image: DecorationImage(image: imageSelected),
            ),
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep >= 2 ? StepState.complete : StepState.disabled,
      ),
    ];
  }
}
