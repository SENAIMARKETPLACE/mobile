// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/core/presentation/widgets/sollaris_drawer.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';
import 'package:flutter/material.dart';

import 'package:cep/src/core/presentation/widgets/solaris_bottom_app_bar.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/widgets/build_form_produto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenFormProduto extends StatefulWidget {
  const ScreenFormProduto({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Produto product;

  @override
  State<ScreenFormProduto> createState() => _ScreenFormProdutoState();
}

class _ScreenFormProdutoState extends State<ScreenFormProduto> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SollarisBottomAppBar(subTitle: 'Adicionar Produto'),
        drawer: const SollarisDrawer(),
        body: BuildFormProduto(product: widget.product),
      ),
    );
  }
}
