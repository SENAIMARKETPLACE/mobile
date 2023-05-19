// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';

import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/core/utils/sollaris_error_snackbar.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';

class ScreenProduto extends StatefulWidget {
  const ScreenProduto({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<ScreenProduto> createState() => _ScreenProdutoState();
}

class _ScreenProdutoState extends State<ScreenProduto> {
  late final Access pref;

  bool _exibeSearch = false;
  final TextEditingController _search = TextEditingController();

  Future<Access> getPreferences() async {
    await Future.delayed(const Duration(seconds: 2));

    return pref = await PreferencesActions.load();
  }

  @override
  void initState() {
    super.initState();
    context.read<ProdutoBloc>().add(GetProdutosEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'Meus Produtos',
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
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
                    context.read<ProdutoBloc>().add(
                          FiltroProdutoEvent(value: value),
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
                    context.read<ProdutoBloc>().add(
                          const FiltroProdutoEvent(value: ''),
                        );
                  },
                ),
              ),
            ),
          ),
        Expanded(
          child: BlocConsumer<ProdutoBloc, ProdutoState>(
            listener: (context, state) {
              if (state.status == ProdutoStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SollarisErrorSnackBar(message: state.message),
                );
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case ProdutoStatus.initial:
                case ProdutoStatus.loading:
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                case ProdutoStatus.success:
                  if (state.produtos.isEmpty) {
                    return const Center(
                      child: Text(
                        '''Não existem Produtos salvas!''',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async => context
                        .read<ProdutoBloc>()
                        .add(GetProdutosEvent(id: widget.id)),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: state.produtosFiltro.length,
                      itemBuilder: (context, index) {
                        final categoria = state.produtosFiltro[index];
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            // onTap: () => Navigator.of(context).push(
                            //   MaterialPageRoute<void>(
                            //     builder: (_) =>
                            //         ScreenSubCategoria(categoria: categoria),
                            //     fullscreenDialog: true,
                            //   ),
                            // ),
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
                case ProdutoStatus.error:
                  return const Icon(Icons.add);
              }
            },
          ),
        ),
      ],
    );
  }
}
