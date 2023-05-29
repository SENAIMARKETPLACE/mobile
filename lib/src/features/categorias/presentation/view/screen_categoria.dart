import 'package:cep/src/core/presentation/widgets/sollaris_error_snackbar.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: SizedBox(
        //   height: 24,
        //   child: Image.asset(
        //     'assets/images/logo_neotriad.png',
        //     fit: BoxFit.scaleDown,
        //   ),
        // ),
        title: const Text('Sollaris'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            AppBar().preferredSize.height,
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'Categorias',
              style: TextStyle(fontSize: 16),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _exibeSearch = !_exibeSearch;
                  });
                },
              ),
            ],
            elevation: 0,
          ),
        ),
      ),
      // drawer: const NeotriadDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        if (_exibeSearch)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.search),
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
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    _search.clear();
                    context.read<CategoriaBloc>().add(
                          const FiltroCategoriaEvent(value: ''),
                        );
                  },
                ),
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
                    return const Center(
                      child: Text(
                        '''Não existem categorias salvas!''',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async =>
                        context.read<CategoriaBloc>().add(GetCategoriasEvent()),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: state.categoriasFiltro.length,
                      itemBuilder: (context, index) {
                        final categoria = state.categoriasFiltro[index];
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) =>
                                    ScreenSubCategoriaId(categoria: categoria),
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
                                        width: 2, color: Colors.blue),
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
