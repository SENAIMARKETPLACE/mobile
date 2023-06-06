// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cep/src/core/presentation/widgets/sollaris_text_button.dart';
import 'package:cep/src/features/cadastro/domain/entities/address.dart';
import 'package:cep/src/features/cadastro/presentation/view/screen_confirm.dart';
import 'package:flutter/material.dart';

import 'package:cep/src/common/hive/register.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_title.dart';

class ScreenEndereco extends StatefulWidget {
  const ScreenEndereco({
    Key? key,
    required this.address,
  }) : super(key: key);

  final Address address;

  @override
  State<ScreenEndereco> createState() => _ScreenEnderecoState();
}

class _ScreenEnderecoState extends State<ScreenEndereco> {
  final chave5 = GlobalKey<FormState>();
  final controllerRua = TextEditingController();
  final controllerBairro = TextEditingController();
  final controllerNumero = TextEditingController();
  final controllerCidade = TextEditingController();
  final controllerEstado = TextEditingController();
  final controllerCompl = TextEditingController();

  @override
  void initState() {
    controllerRua.text = widget.address.logradouro;
    controllerBairro.text = widget.address.bairro;
    controllerCidade.text = widget.address.cidade;
    controllerEstado.text = widget.address.estado;
    super.initState();
  }

  void _showSnackbar(String message) {
    final snackbar = SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 198, 146, 243),
                  Color.fromARGB(255, 198, 166, 243),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 39, 77, 109),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 198, 146, 243),
              Color.fromARGB(255, 167, 222, 222),
            ],
          )),
          child: Stack(
            children: [
              Form(
                key: chave5,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 70),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SollarisTitle(title: "Complete os dados"),
                        const SizedBox(height: 10),
                        SollarisTextField(
                          label: "Rua",
                          hint: "Digite o nome da rua",
                          controller: controllerRua,
                          onSaved: (value) =>
                              value != null ? Register().saveRua(value) : null,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Rua inválida. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        SollarisTextField(
                          label: "Bairro",
                          hint: "Digite o nome do bairro",
                          controller: controllerBairro,
                          onSaved: (value) => value != null
                              ? Register().saveBairro(value)
                              : null,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Bairro inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        SollarisTextField(
                          label: "Número",
                          hint: "Digite o número",
                          controller: controllerNumero,
                          typeKey: TextInputType.number,
                          onSaved: (value) => value != null
                              ? Register().saveNumero(value)
                              : null,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Número inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        SollarisTextField(
                          label: "Complemento",
                          hint: "Digite o complemento",
                          controller: controllerCompl,
                          onSaved: (value) => value != null
                              ? Register().saveComplemento(value)
                              : null,
                          validator: (_) {
                            return null;
                          },
                        ),
                        SollarisTextField(
                          label: "Cidade",
                          hint: "Digite a cidade",
                          controller: controllerCidade,
                          onSaved: (value) => value != null
                              ? Register().saveCidade(value)
                              : null,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Cidade inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                        SollarisTextField(
                          label: "Estado",
                          hint: "Digite o estado",
                          controller: controllerEstado,
                          onSaved: (value) => value != null
                              ? Register().saveEstado(value)
                              : null,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Cidade inválido. Digite novamente';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: SollarisTextButton(
                    textButton: 'Próximo',
                    function: () {
                      if (chave5.currentState!.validate()) {
                        chave5.currentState!.save();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ScreenConfirm(),
                          ),
                        );
                      } else {
                        _showSnackbar('Verifique os campos');
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
