import 'package:cep/src/dependency_assembly.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_event.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CepForm extends StatefulWidget {
  const CepForm({super.key});

  @override
  State<CepForm> createState() => _CepFormState();
}

class _CepFormState extends State<CepForm> {
  final _controller = TextEditingController();
  bool isLoading = false;
  final bloc = dependency<RegisterCompanyBloc>();

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
                body: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                      ),
                      IconButton(
                        onPressed: () {
                          // final state = bloc.state;

                          // if (state.status == SignUpStatus.sucess) {
                          bloc.add(GetCepEvent(cep: _controller.text));
                          isLoading = true;
                          // }
                        },
                        icon: isLoading
                            ? const CircularProgressIndicator()
                            : const Icon(Icons.search),
                      ),
                      isLoading
                          ? const CircularProgressIndicator()
                          : Text(state.endereco.logradouro),
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
}
