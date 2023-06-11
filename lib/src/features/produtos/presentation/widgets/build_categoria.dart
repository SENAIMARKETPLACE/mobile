import 'package:cep/src/features/categorias/domain/entities/categoria.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildCategoria extends StatefulWidget {
  const BuildCategoria({super.key});

  @override
  State<BuildCategoria> createState() => _BuildCategoriaState();
}

class _BuildCategoriaState extends State<BuildCategoria> {
  final List<Categoria> _categoriaSelected = [];

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
                          .add(FiltroCategoriaEvent(value: value ?? ''));
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 16,
                        color: Color.fromARGB(255, 189, 66, 201),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 189, 66, 201),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 189, 66, 201),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.categoriasFiltro.length,
                      itemBuilder: (context, index) {
                        final categoria = state.categoriasFiltro[index];

                        return Column(
                          children: [
                            CheckboxListTile(
                              key: Key(categoria.id),
                              title: Text(
                                state.categoriasFiltro[index].nome,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }

                                setState(() {
                                  _categoriaSelected
                                      .add(state.categoriasFiltro[index]);
                                  _categoriaSelected.removeWhere(
                                    (unselectedTeam) =>
                                        unselectedTeam.id != categoria.id,
                                  );
                                });
                              },
                              value: _categoriaSelected.any(
                                (selectedTeam) =>
                                    selectedTeam.id == categoria.id,
                              ),
                              checkboxShape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 189, 66, 201)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              activeColor:
                                  const Color.fromARGB(255, 189, 66, 201),
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
                        backgroundColor:
                            const Color.fromARGB(255, 189, 66, 201),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        final Categoria categoria = _categoriaSelected.first;

                        Navigator.of(context).pop(categoria);
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
              child: Text('Erro ao carregar Categorias.'),
            );
        }
      },
    );
  }
}
