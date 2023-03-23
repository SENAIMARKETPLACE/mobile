import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sollaris_teste/src/dependency_assembly.dart' as di;
import 'package:sollaris_teste/src/features/signup/domain/entities/endereco.dart';
import 'package:sollaris_teste/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:sollaris_teste/src/features/signup/presentation/bloc/signup_event.dart';
import 'package:sollaris_teste/src/features/signup/presentation/bloc/signup_state.dart';

class CepForm extends StatefulWidget {
  const CepForm({super.key});

  @override
  State<CepForm> createState() => _CepFormState();
}

class _CepFormState extends State<CepForm> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => di.dependency<SignUpBloc>(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Scaffold(
            body: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller,
                  ),
                  IconButton(
                    onPressed: () {
                      final state = context.read<SignUpBloc>().state;

                      if (state.status == SignUpStatus.sucess) {
                        context.read<SignUpBloc>().add(
                              SetCepEvent(
                                endereco: Endereco(
                                  id: state.endereco.id,
                                  cep: _controller.text,
                                  numero: state.endereco.numero,
                                  estado: state.endereco.estado,
                                  bairro: state.endereco.bairro,
                                  cidade: state.endereco.cidade,
                                  logradouro: state.endereco.logradouro,
                                ),
                              ),
                            );
                      }
                    },
                    icon: const Icon(Icons.search),
                  ),
                  Text(state.endereco.cidade),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
