import 'dart:developer';

import 'package:cep/src/core/presentation/widgets/sollaris_app_bar.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_button.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:flutter/material.dart';

class ScreenFormProduto extends StatefulWidget {
  const ScreenFormProduto({super.key});

  @override
  State<ScreenFormProduto> createState() => _ScreenFormProdutoState();
}

class _ScreenFormProdutoState extends State<ScreenFormProduto> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'nome': TextEditingController(),
    'preco': TextEditingController(),
    'img': TextEditingController(),
    'categoria': TextEditingController(),
    'sub-categoria': TextEditingController(),
    'publico': TextEditingController(),
    'detalhe': TextEditingController(),
    'tamanho': TextEditingController(),
    'peso': TextEditingController(),
    'cor': TextEditingController(),
    'quantidade': TextEditingController(),
    'observacao': TextEditingController(),
  };
  bool isExibMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SollarisAppBar(),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  children: [
                    SollarisTextField(
                      label: 'Categoria',
                      hint: 'Selecione a Categoria',
                      prefixIcon: Icons.category,
                      suffixIcon: const Icon(Icons.search),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe uma categoria';
                        }
                        return null;
                      },
                      controller: _controllers['categoria']!,
                      isReadOnly: true,
                      onTap: () => log('Opa'),
                    ),
                    SollarisTextField(
                      label: 'Sub-Categoria',
                      hint: 'Selecione a Sub-Categoria',
                      prefixIcon: Icons.category,
                      suffixIcon: const Icon(Icons.search),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe uma sub-categoria';
                        }
                        return null;
                      },
                      controller: _controllers['sub-categoria']!,
                      isReadOnly: true,
                      onTap: () => log('Opa'),
                    ),
                    SollarisTextField(
                      label: 'Público',
                      hint: 'Selecione o público',
                      prefixIcon: Icons.category,
                      suffixIcon: const Icon(Icons.search),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe um público';
                        }
                        return null;
                      },
                      controller: _controllers['publico']!,
                      isReadOnly: true,
                      onTap: () => log('Opa'),
                    ),
                    SollarisTextField(
                      label: 'Título',
                      hint: 'Informe o título do produto',
                      prefixIcon: Icons.inventory,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Título de produto inválido, tente novamente';
                        }
                        return null;
                      },
                      controller: _controllers['nome']!,
                    ),
                    SollarisTextField(
                      label: 'Preço',
                      hint: 'Informe o preço do produto',
                      prefixIcon: Icons.attach_money,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Preço de produto inválido, tente novamente';
                        }
                        return null;
                      },
                      controller: _controllers['preco']!,
                    ),
                    SizedBox(
                      height: 103,
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: SollarisTextField(
                              label: 'Url Imagem',
                              hint: 'Informe a url da imagem',
                              prefixIcon: Icons.image,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Url inválida, tente novamente';
                                }
                                return null;
                              },
                              controller: _controllers['img']!,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 65, 12, 96)),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/image/image_default.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SollarisTextField(
                            label: 'Tamanho',
                            hint: '',
                            alignText: TextAlign.center,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o tamanho';
                              }
                              return null;
                            },
                            controller: _controllers['tamanho']!,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SollarisTextField(
                            label: 'Peso',
                            hint: '',
                            alignText: TextAlign.center,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o peso';
                              }
                              return null;
                            },
                            controller: _controllers['peso']!,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SollarisTextField(
                            label: 'Cor',
                            hint: '',
                            alignText: TextAlign.center,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe a cor';
                              }
                              return null;
                            },
                            controller: _controllers['cor']!,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SollarisTextField(
                            label: 'Quantidade',
                            hint: '',
                            alignText: TextAlign.center,
                            validator: (value) {
                              return 'Informe a quantidade';
                            },
                            controller: _controllers['quantidade']!,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Descrição',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 65, 12, 96))),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(212, 225, 223, 223),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _controllers['observacao']!,
                                onChanged: (value) {
                                  if (value.isEmpty || value == '') {
                                    setState(() {
                                      isExibMessage = true;
                                    });
                                  } else {
                                    setState(() {
                                      isExibMessage = false;
                                    });
                                  }
                                },
                                style: const TextStyle(fontSize: 20),
                                decoration: const InputDecoration(
                                  constraints: BoxConstraints(
                                      maxHeight: double.infinity),
                                  border: InputBorder.none,
                                ),
                                maxLines: 13,
                                maxLength: 500,
                              ),
                            ),
                          ),
                          isExibMessage
                              ? const Text(
                                  '  Informe a descrição',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
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
                child: Expanded(
                  child:
                      SollarisTextButton(textButton: 'Salvar', function: () {}),
                )),
          )
        ],
      ),
    );
  }
}
