// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/widgets/build_form_produto.dart';

class BuildEdit extends StatefulWidget {
  const BuildEdit({
    Key? key,
    required this.produto,
  }) : super(key: key);

  final Produto produto;

  @override
  State<BuildEdit> createState() => _BuildEditState();
}

class _BuildEditState extends State<BuildEdit> {
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
              // Lógica para a opção de excluir
              Navigator.pop(context); // Fechar o bottom sheet
            },
          ),
        ],
      ),
    );
  }
}
