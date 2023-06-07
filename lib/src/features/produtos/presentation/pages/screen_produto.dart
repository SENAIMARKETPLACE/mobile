// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/presentation/widgets/solaris_bottom_app_bar.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';

import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_error_snackbar.dart';
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

  List<Produto> example = [
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
    const Produto(
        id: '',
        nome: 'Produto 1',
        descricao: 'Exemplp',
        preco: '100',
        foto: 'teste',
        publico: 'Masculino'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SollarisBottomAppBar(
        subTitle: 'Meus Produtos',
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
                // return Center(
                //   child: CircularProgressIndicator(
                //     color: Theme.of(context).colorScheme.primary,
                //   ),
                // );
                case ProdutoStatus.success:
                  // if (state.produtos.isEmpty) {
                  //   return const Center(
                  //     child: Text(
                  //       '''Não existem Produtos salvas!''',
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   );
                  // }

                  return RefreshIndicator(
                    onRefresh: () async {},
                    child: GridView.builder(
                      itemCount: example.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 220,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 245, 235, 242),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 189, 66, 201),
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
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzRGkvN9WVysP2_3AbXtdgTegy9mEELt2yFirxQymBg&s'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    example[index].nome,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('R\$ ${example[index].preco}')
                                ],
                              ),
                            ),
                            Positioned(
                                child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          child: Wrap(
                                            children: [
                                              ListTile(
                                                leading: const Icon(Icons.edit),
                                                title: const Text('Editar'),
                                                onTap: () {
                                                  // Lógica para a opção de editar
                                                  Navigator.pop(
                                                      context); // Fechar o bottom sheet
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                    const Icon(Icons.delete),
                                                title: const Text('Excluir'),
                                                onTap: () {
                                                  // Lógica para a opção de excluir
                                                  Navigator.pop(
                                                      context); // Fechar o bottom sheet
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                            ))
                          ],
                        );
                      },
                    ),
                  );

                // return RefreshIndicator(
                //   onRefresh: () async => context
                //       .read<ProdutoBloc>()
                //       .add(GetProdutosEvent(id: widget.id)),
                //   child: ListView.separated(
                //     separatorBuilder: (context, index) =>
                //         const SizedBox(height: 8),
                //     itemCount: state.produtosFiltro.length,
                //     itemBuilder: (context, index) {
                //       final categoria = state.produtosFiltro[index];
                //       return DecoratedBox(
                //         decoration: BoxDecoration(
                //           border: Border.all(color: Colors.blue),
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         child: ListTile(
                //           // onTap: () => Navigator.of(context).push(
                //           //   MaterialPageRoute<void>(
                //           //     builder: (_) =>
                //           //         ScreenSubCategoria(categoria: categoria),
                //           //     fullscreenDialog: true,
                //           //   ),
                //           // ),
                //           leading: Padding(
                //             padding: const EdgeInsets.only(top: 4),
                //             child: SizedBox.square(
                //               dimension: 16,
                //               child: DecoratedBox(
                //                 decoration: BoxDecoration(
                //                   border: Border.all(
                //                       width: 2, color: Colors.blue),
                //                   borderRadius: BorderRadius.circular(2),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           horizontalTitleGap: 0,
                //           title: Text(categoria.nome),
                //         ),
                //       );
                //     },
                //   ),
                // );
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
