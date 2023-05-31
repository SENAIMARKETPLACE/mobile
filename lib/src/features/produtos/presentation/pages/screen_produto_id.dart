import 'package:cep/src/core/presentation/widgets/sollaris_app_bar.dart';
import 'package:cep/src/features/produtos/domain/entities/detalhes.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenProdutoId extends StatefulWidget {
  const ScreenProdutoId({super.key});

  @override
  State<ScreenProdutoId> createState() => _ScreenProdutoIdState();
}

class _ScreenProdutoIdState extends State<ScreenProdutoId> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SollarisAppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                const product = Produto(
                  id: '',
                  nome: 'Meu Produto',
                  descricao: 'Criando produto',
                  preco: '250.00',
                  foto: 'default',
                  publico: 'Masculino',
                  idCategoria: '1',
                  idEmpresa: '1',
                  idSubCategoria: '1',
                  detalhe: Detalhe(
                    id: '',
                    tamanho: '120GR',
                    peso: '65CM',
                    cor: 'Preto',
                    quantidade: '300',
                  ),
                );

                context
                    .read<ProdutoBloc>()
                    .add(CreateProdutoEvent(produto: product));
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
