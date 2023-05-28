// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card_produto.dart';
import 'package:cep/src/features/produtos/domain/entities/produto.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListProducts extends StatelessWidget {
  const HomeListProducts({
    Key? key,
    required this.title,
    this.heigthCarousel = 120,
    this.route,
  }) : super(key: key);

  final String title;
  final Widget? route;
  final double heigthCarousel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                // return MaterialPageRoute(builder: (context) => route!)
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
        BlocBuilder<ProdutoBloc, ProdutoState>(
          bloc: context.read<ProdutoBloc>()..add(GetAllProdutosEvent()),
          builder: (context, state) {
            switch (state.status) {
              case ProdutoStatus.initial:
              case ProdutoStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
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
                  return const Text('Nenhuma Produto cadastrado;');
                } else {
                  return SizedBox(
                    height: heigthCarousel,
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
                return const Text('Erro');
            }
          },
        ),
      ],
    );
  }
}
