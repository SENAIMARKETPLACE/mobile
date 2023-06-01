import 'dart:developer';

import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:flutter/material.dart';

import 'package:cep/src/core/presentation/widgets/sollaris_text_button.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildFormProduto extends StatefulWidget {
  const BuildFormProduto({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildFormProduto> createState() => _BuildFormProdutoState();
}

class _BuildFormProdutoState extends State<BuildFormProduto> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    return Stack(
      children: [
        Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                    onTap: () => showModalBottomSheet<List<Categoria>>(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      context: context,
                      builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: const EdgeInsets.all(16),
          child: Flex(
            direction: Axis.vertical,
            children: [
              TextField(
                onChanged: (String? value) {
                  context.read<CategoriaBloc>().add(
                        FiltroCategoriaEvent(value: value ?? '')
                      );
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  // itemCount: teamsState.filteredList.length,
                  itemBuilder: (context, index) {

                    // return Column(
                    //   children: [
                    //     CheckboxListTile(
                    //       key: Key(team.teamId),
                    //       title: Text(
                    //         teams[index].name,
                    //         overflow: TextOverflow.fade,
                    //         softWrap: false,
                    //       ),
                    //       onChanged: (value) {
                    //         if (value == null) {
                    //           return;
                    //         }

                    //         if (value) {
                    //           setState(() {
                    //             selectedTeams.add(teamSubscriber[index]);
                    //           });
                    //         } else {
                    //           setState(() {
                    //             selectedTeams.removeWhere(
                    //               (unselectedTeam) =>
                    //                   unselectedTeam.teamId == team.teamId,
                    //             );
                    //           });
                    //         }
                    //       },
                    //       value: selectedTeams.any(
                    //         (selectedTeam) =>
                    //             selectedTeam.teamId == team.teamId,
                    //       ),
                    //       checkboxShape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(4),
                    //       ),
                    //       activeColor: Theme.of(context).colorScheme.primary,
                    //     ),
                    //   ],
                    // );
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop(selectedTeams);
                  },
                  child: const Text(
                    'Escolher',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
                    ),
                    // ).then(
                    //   (value) {
                    //     if (value != null) {
                    //       final state = context.read<RoleFormBloc>().state;

                    //       if (state.status == RoleFormStatus.sucess) {
                    //         context.read<RoleFormBloc>().add(
                    //               SetTeamRoleEvent(
                    //                 role: Role(
                    //                   id: state.role.id,
                    //                   title: state.role.title,
                    //                   description: state.role.description,
                    //                   color: state.role.color,
                    //                   minutesIdeal: state.role.minutesIdeal,
                    //                   teams: value,
                    //                   minutes: state.role.minutes,
                    //                   hours: state.role.hours,
                    //                 ),
                    //               ),
                    //             );
                    //       }
                    //     } else {
                    //       return;
                    //     }
                    //   },
                    // ),
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
                    onTap: () {},
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
                    onTap: () {},
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
                    height: 130,
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
                              image:
                                  AssetImage('assets/image/image_default.jpg'),
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
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
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
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
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
                child: SollarisTextButton(
                    textButton: 'Salvar',
                    function: () {
                      if (formKey.currentState!.validate()) {
                      } else {
                        log('ops');
                      }
                    }),
              )),
        )
      ],
    );
  }
}
