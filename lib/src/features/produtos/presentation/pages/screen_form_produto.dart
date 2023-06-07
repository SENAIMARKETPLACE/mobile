import 'package:cep/src/core/presentation/widgets/solaris_bottom_app_bar.dart';
import 'package:cep/src/features/produtos/presentation/widgets/build_form_produto.dart';
import 'package:flutter/material.dart';

class ScreenFormProduto extends StatefulWidget {
  const ScreenFormProduto({super.key});

  @override
  State<ScreenFormProduto> createState() => _ScreenFormProdutoState();
}

class _ScreenFormProdutoState extends State<ScreenFormProduto> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SollarisBottomAppBar(subTitle: 'Adicionar Produto'),
      drawer: Drawer(),
      body: BuildFormProduto(),
    );
  }
}
