// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/core/presentation/widgets/solaris_bottom_app_bar.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_error_snackbar.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';

class ScreenProdutoId extends StatefulWidget {
  const ScreenProdutoId({
    Key? key,
    required this.idSubCategoria,
    required this.nomeSubCategoria,
  }) : super(key: key);

  final String idSubCategoria;
  final String nomeSubCategoria;

  @override
  State<ScreenProdutoId> createState() => _ScreenProdutoIdState();
}

class _ScreenProdutoIdState extends State<ScreenProdutoId> {
  late final Access pref;

  bool _exibeSearch = false;
  final TextEditingController _search = TextEditingController();

  Future<Access> getPreferences() async {
    return pref = await PreferencesActions.load();
  }

  @override
  void initState() {
    super.initState();
    getPreferences().then(
      (prefs) {
        context.read<ProdutoBloc>().add(
              GetProdutosEvent(
                idSubCategoria: widget.idSubCategoria,
                idEmpresa: pref.id,
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SollarisBottomAppBar(
        subTitle: 'Produtos de ${widget.nomeSubCategoria}',
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

  _buildBody() {
    return Column(
      children: <Widget>[
        if (_exibeSearch)
          Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 189, 66, 201),
              ),
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
                icon: const Icon(
                  Icons.cancel,
                  color: Color.fromARGB(255, 189, 66, 201),
                ),
                onPressed: () {
                  _search.clear();
                  context.read<ProdutoBloc>().add(
                        const FiltroProdutoEvent(value: ''),
                      );
                },
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
                    return Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              '''Não existem produtos adicionados!''',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            GestureDetector(
                              onTap: () async =>
                                  context.read<ProdutoBloc>().add(
                                        GetProdutosEvent(
                                          idSubCategoria: widget.idSubCategoria,
                                          idEmpresa: pref.id,
                                        ),
                                      ),
                              child: const Icon(Icons.refresh,
                                  size: 70,
                                  color: Color.fromARGB(255, 189, 66, 201)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    color: const Color.fromARGB(255, 189, 66, 201),
                    onRefresh: () async => context.read<ProdutoBloc>().add(
                          GetProdutosEvent(
                            idSubCategoria: widget.idSubCategoria,
                            idEmpresa: pref.id,
                          ),
                        ),
                    child: GridView.builder(
                      itemCount: state.produtosFiltro.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 220,
                      ),
                      itemBuilder: (context, index) {
                        final produto = state.produtosFiltro[index];

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 2,
                                blurRadius: 9,
                                offset: const Offset(0,
                                    3), // changes the shadow direction vertically
                              ),
                            ],
                            color: const Color.fromARGB(255, 245, 235, 242),
                            border: Border.all(
                              color: const Color.fromARGB(255, 189, 66, 201),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(produto.foto ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzRGkvN9WVysP2_3AbXtdgTegy9mEELt2yFirxQymBg&s'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                produto.nome,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('R\$ ${produto.preco}')
                            ],
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
