// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card_produto.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';

class HomeListProducts extends StatefulWidget {
  const HomeListProducts({
    Key? key,
    required this.title,
    this.route,
    this.heigthCarousel = 120,
    required this.idEmpresa,
  }) : super(key: key);

  final String title;
  final Widget? route;
  final double heigthCarousel;
  final String idEmpresa;

  @override
  State<HomeListProducts> createState() => _HomeListProductsState();
}

class _HomeListProductsState extends State<HomeListProducts> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProdutoBloc>()
        .add(GetAllProdutosEvent(idEmpresa: widget.idEmpresa));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => widget.route!),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
        BlocBuilder<ProdutoBloc, ProdutoState>(
          // bloc: ,
          builder: (context, state) {
            switch (state.status) {
              case ProdutoStatus.initial:
              case ProdutoStatus.loading:
                Future.delayed(const Duration(seconds: 2));
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 189, 66, 201),
                  ),
                );
              case ProdutoStatus.success:
                List<HomeCardProduto> myProductCard = [];

                for (var index in state.produtos) {
                  myProductCard.add(
                    HomeCardProduto(
                      titleProduct: index.nome,
                      price: double.parse(index.preco),
                      urlImage: index.foto,
                    ),
                  );
                }

                if (myProductCard.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text('Nenhuma Produto adicionado',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 131, 68, 136))),
                  );
                } else {
                  return SizedBox(
                    height: widget.heigthCarousel,
                    child: ListView.builder(
                      itemCount: myProductCard.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: myProductCard[index],
                          ),
                        );
                      },
                    ),
                  );
                }
              case ProdutoStatus.error:
                return const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text('Erro ao carregar Produtos',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 131, 68, 136))),
                );
            }
          },
        ),
      ],
    );
  }
}
