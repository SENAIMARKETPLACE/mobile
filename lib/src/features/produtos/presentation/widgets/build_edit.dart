// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:flutter/material.dart';

import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/widgets/build_form_produto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildOptions extends StatefulWidget {
  const BuildOptions({
    Key? key,
    required this.produto,
  }) : super(key: key);

  final Produto produto;

  @override
  State<BuildOptions> createState() => _BuildOptionsState();
}

class _BuildOptionsState extends State<BuildOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Editar'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return BuildFormProduto(
                    product: widget.produto,
                  );
                },
              )); // Fechar o bottom sheet
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Excluir'),
            onTap: () {
              context
                  .read<ProdutoBloc>()
                  .add(DeleteProductEvent(id: widget.produto.id));

              Navigator.pop(context); // Fechar o bottom sheet
            },
          ),
        ],
      ),
    );
  }
}
