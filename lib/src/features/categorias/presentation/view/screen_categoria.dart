import 'package:cep/src/core/presentation/widgets/solaris_bottom_app_bar.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_error_snackbar.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:cep/src/features/categorias/presentation/view/screen_sub_categoria_all.dart';
import 'package:cep/src/features/categorias/presentation/view/screen_sub_categoria_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCategoria extends StatefulWidget {
  const ScreenCategoria({super.key});

  @override
  State<ScreenCategoria> createState() => _ScreenCategoriaState();
}

class _ScreenCategoriaState extends State<ScreenCategoria> {
  bool _exibeSearch = false;
  final TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CategoriaBloc>().add(GetCategoriasEvent());
  }

  List<String> example = ['Categoria 1', 'Categoria 2', 'Categoria 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SollarisBottomAppBar(
        subTitle: 'Categorias',
        search: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              _exibeSearch = !_exibeSearch;
            });
          },
        ),
      ),
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        if (_exibeSearch)
          Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListTile(
              leading: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 189, 66, 201),
              ),
              title: TextField(
                onChanged: (value) {
                  context.read<CategoriaBloc>().add(
                        FiltroCategoriaEvent(value: value),
                      );
                },
                controller: _search,
                decoration: const InputDecoration(
                  hintText: 'Pesquisar',
                  border: InputBorder.none,
                ),

                // onChanged: onValueChanged,
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: Color.fromARGB(255, 189, 66, 201),
                ),
                onPressed: () {
                  _search.clear();
                  context.read<CategoriaBloc>().add(
                        const FiltroCategoriaEvent(value: ''),
                      );
                },
              ),
            ),
          ),
        Expanded(
          child: BlocConsumer<CategoriaBloc, CategoriaState>(
            listener: (context, state) {
              if (state.status == CategoriaStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SollarisErrorSnackBar(message: state.message),
                );
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case CategoriaStatus.initial:
                case CategoriaStatus.loading:
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                case CategoriaStatus.success:
                  if (state.categoriasFiltro.isEmpty) {
                    return Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              '''Não existem categorias salvas!''',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            GestureDetector(
                              onTap: () async => context
                                  .read<CategoriaBloc>()
                                  .add(GetCategoriasEvent()),
                              child: const Icon(
                                Icons.refresh,
                                size: 70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async =>
                        context.read<CategoriaBloc>().add(GetCategoriasEvent()),
                    child: ListView.separated(
                      itemCount: state.categoriasFiltro.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final categoria = state.categoriasFiltro[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 235, 242),
                            border: Border.all(
                              color: const Color.fromARGB(255, 189, 66, 201),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => ScreenSubCategoriaId(
                                    categoria: categoria,
                                    categorieTitle: categoria.nome),
                                // const ScreenSubCategoriaAll(),
                                fullscreenDialog: true,
                              ),
                            ),
                            leading: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SizedBox.square(
                                dimension: 16,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.blue,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                            horizontalTitleGap: 0,
                            title: Text(categoria.nome),
                          ),
                        );
                      },
                    ),
                  );

                case CategoriaStatus.error:
                  return const Icon(Icons.add);
              }
            },
          ),
        ),
      ],
    );
  }
}
