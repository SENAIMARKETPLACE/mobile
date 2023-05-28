// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListCategories extends StatelessWidget {
  const HomeListCategories({
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
        BlocBuilder<CategoriaBloc, CategoriaState>(
          builder: (context, state) {
            switch (state.status) {
              case CategoriaStatus.initial:
              case CategoriaStatus.loading:
                return const Center(
                  child: Text('Carregando..'),
                );
              case CategoriaStatus.success:
                List<HomeCard> myCategoriesCard = [];

                for (var index in state.categorias) {
                  myCategoriesCard.add(
                    HomeCard(name: index.nome),
                  );
                }

                if (myCategoriesCard.isEmpty) {
                  return const Text('Nenhuma Categoria cadastrada;');
                } else {
                  return SizedBox(
                    height: heigthCarousel,
                    child: ListView.builder(
                      itemCount: myCategoriesCard.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: myCategoriesCard[index],
                          ),
                        );
                      },
                    ),
                  );
                }
              case CategoriaStatus.error:
                return const Text('Erro');
            }
          },
        ),
      ],
    );
  }
}
