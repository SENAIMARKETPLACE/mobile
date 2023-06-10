// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/domain/entities/sub_categoria.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';

class BuildSubCategoria extends StatefulWidget {
  const BuildSubCategoria({
    Key? key,
    required this.idCategoria,
  }) : super(key: key);

  final String idCategoria;

  @override
  State<BuildSubCategoria> createState() => _BuildSubCategoriaState();
}

class _BuildSubCategoriaState extends State<BuildSubCategoria> {
  final List<SubCategoria> _subCategoriaSelected = [];

  @override
  void initState() {
    super.initState();
    context
        .read<CategoriaBloc>()
        .add(GetSubCategoriasEvent(id: widget.idCategoria));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriaBloc, CategoriaState>(
      builder: (context, state) {
        switch (state.status) {
          case CategoriaStatus.initial:
          case CategoriaStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CategoriaStatus.success:
            return Container(
              height: MediaQuery.of(context).size.height * 0.65,
              padding: const EdgeInsets.all(16),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  TextField(
                    onChanged: (String? value) {
                      context
                          .read<CategoriaBloc>()
                          .add(FiltroSubCategoriaEvent(value: value ?? ''));
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
                      itemCount: state.subCategoriasFiltro.length,
                      itemBuilder: (context, index) {
                        final subCategoria = state.subCategoriasFiltro[index];

                        return Column(
                          children: [
                            CheckboxListTile(
                              key: Key(subCategoria.id),
                              title: Text(
                                state.subCategoriasFiltro[index].nome,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }

                                setState(() {
                                  _subCategoriaSelected
                                      .add(state.subCategoriasFiltro[index]);
                                  _subCategoriaSelected.removeWhere(
                                    (unselectedTeam) =>
                                        unselectedTeam.id != subCategoria.id,
                                  );
                                });
                              },
                              value: _subCategoriaSelected.any(
                                (selectedTeam) =>
                                    selectedTeam.id == subCategoria.id,
                              ),
                              checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        );
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
                        final SubCategoria subCategoria =
                            _subCategoriaSelected.first;

                        Navigator.of(context).pop(subCategoria);
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
            );
          case CategoriaStatus.error:
            return const Center(
              child: Text('Erro'),
            );
        }
      },
    );
  }
}
