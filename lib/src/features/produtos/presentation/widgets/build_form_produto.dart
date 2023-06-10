import 'dart:developer';

import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_error_snackbar.dart';
import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/produtos/domain/entities/detalhes.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';
import 'package:cep/src/features/produtos/presentation/pages/screen_produto_all.dart';
import 'package:cep/src/features/produtos/presentation/widgets/build_categoria.dart';
import 'package:cep/src/features/produtos/presentation/widgets/build_image.dart';
import 'package:cep/src/features/produtos/presentation/widgets/build_sub_categoria.dart';
import 'package:flutter/material.dart';

import 'package:cep/src/core/presentation/widgets/sollaris_text_button.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BuildFormProduto extends StatefulWidget {
  const BuildFormProduto({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildFormProduto> createState() => _BuildFormProdutoState();
}

class _BuildFormProdutoState extends State<BuildFormProduto> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> _publico = [
    'Masculino',
    'Feminino',
    'Infantil',
    'Unissex'
  ];
  List<bool> isSelectedList = List.generate(2, (index) => false);
  bool isExibMessage = false;
  String? itemSelected;
  String? idCategoriaSelected;
  String? idSubCategoriaSelected;
  String? idEmpresa;
  Access? pref;
  late final Categoria categoriaSelected;

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

  Widget? _iconLeading(String name) {
    switch (name) {
      case 'Masculino':
        return const Icon(Icons.male);
      case 'Feminino':
        return const Icon(Icons.female);
      case 'Infantil':
        return const FaIcon(Icons.gamepad_outlined);
      case 'Unissex':
        return const Icon(Icons.transgender);
    }
    return null;
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: 'R\$ ###.###,##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  void _showSnackBarMessenge(BuildContext context) {
    Future.delayed(const Duration(seconds: 3));

    var snackbarSucess = const SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      content: Text(
        'Produto adicionado com sucesso',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackbarSucess,
    );
  }

  Future<Access> getPreferences() async {
    return pref = await PreferencesActions.load();
  }

  @override
  void initState() {
    super.initState();
    getPreferences().then((value) => idEmpresa = value.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdutoBloc, ProdutoState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 220, 195, 243),
                    Color.fromARGB(255, 167, 222, 222)
                  ],
                ),
              ),
              child: Form(
                key: formKey,
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
                          onTap: () => showModalBottomSheet<Categoria>(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) => const BuildCategoria())
                              .then(
                            (categoria) {
                              _controllers['categoria']!.text = categoria!.nome;
                              idCategoriaSelected = categoria.id;
                              categoriaSelected = categoria;
                            },
                          ),
                          //
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
                          onTap: () => showModalBottomSheet<SubCategoria>(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            builder: (context) => BuildSubCategoria(
                                idCategoria: idCategoriaSelected!),
                          ).then((subCategoria) {
                            _controllers['sub-categoria']!.text =
                                subCategoria!.nome;
                            idSubCategoriaSelected = subCategoria.id;
                          }),
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
                          onTap: () => showModalBottomSheet<List<Categoria>>(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            builder: (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.33,
                              padding: const EdgeInsets.all(16),
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: _publico.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading:
                                                  _iconLeading(_publico[index]),
                                              title: Text(
                                                _publico[index],
                                                overflow: TextOverflow.fade,
                                                softWrap: false,
                                              ),
                                              onTap: () {
                                                _controllers['publico']!.text =
                                                    _publico[index];
                                                return Navigator.of(context)
                                                    .pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                          typeKey: TextInputType.number,
                          inputFormatter: [maskFormatter],
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
                        SollarisTextField(
                          label: 'Url Imagem',
                          hint: 'Informe a url da imagem',
                          prefixIcon: Icons.image,
                          controller: _controllers['img']!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Url vazia';
                            }
                            return null;
                          },
                          isReadOnly: true,
                          onTap: () => showModalBottomSheet<String>(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              context: context,
                              builder: (context) => const BuildImage()).then(
                            (value) => _controllers['img']!.text = value!,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SollarisTextField(
                                label: 'Tamanho',
                                hint: '',
                                maxLength: 5,
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
                                maxLength: 5,
                                suffixText: 'kg',
                                typeKey: TextInputType.number,
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
                                maxLength: 5,
                                typeKey: TextInputType.number,
                                alignText: TextAlign.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe a quantidade';
                                  }
                                  return null;
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
                                  color:
                                      const Color.fromARGB(212, 225, 223, 223),
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
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Expanded(
                    child: SollarisTextButton(
                        textButton: 'Salvar',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            final produto = Produto(
                              id: '',
                              nome: _controllers['nome']!.text,
                              descricao: _controllers['observacao']!.text,
                              preco: _controllers['preco']!.text,
                              foto: _controllers['img']!.text,
                              publico: _controllers['publico']!.text,
                              categoria: categoriaSelected,
                              idCategoria: idCategoriaSelected,
                              idSubCategoria: idSubCategoriaSelected,
                              idEmpresa: idEmpresa,
                              detalhe: Detalhe(
                                id: '',
                                tamanho: _controllers['tamanho']!.text,
                                peso: _controllers['peso']!.text,
                                cor: _controllers['cor']!.text,
                                quantidade: _controllers['quantidade']!.text,
                              ),
                            );

                            final stateT = context.read<ProdutoBloc>().state;

                            if (stateT.status == ProdutoStatus.success) {
                              context.read<ProdutoBloc>().add(
                                    CreateProdutoEvent(
                                      produto: produto,
                                    ),
                                  );

                              _showSnackBarMessenge(context);
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const ScreenProdutoAll(),
                                  fullscreenDialog: true,
                                ),
                              );
                            } else if (state.status == ProdutoStatus.error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SollarisErrorSnackBar(
                                      message: state.message));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SollarisErrorSnackBar(
                                  message: 'Verifique os campos'),
                            );
                          }
                        }),
                  )),
            )
          ],
        );
      },
    );
  }
}
