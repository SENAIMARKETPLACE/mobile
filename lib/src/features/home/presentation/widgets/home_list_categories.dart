// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card.dart';

class HomeListCategories extends StatefulWidget {
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
  State<HomeListCategories> createState() => _HomeListCategoriesState();
}

class _HomeListCategoriesState extends State<HomeListCategories> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriaBloc>().add(GetCategoriasEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 59, 30, 61),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => widget.route!,
                ),
              ),
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 59, 30, 61),
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
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 189, 66, 201),
                  ),
                );
              case CategoriaStatus.success:
                List<HomeCard> myCategoriesCard = [];

                for (var index in state.categorias) {
                  myCategoriesCard.add(
                    HomeCard(name: index.nome),
                  );
                }

                if (myCategoriesCard.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text('Nenhuma Categoria adicionada',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 131, 68, 136))),
                  );
                } else {
                  return SizedBox(
                    height: widget.heigthCarousel,
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
                return const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text('Erro ao carregar Categorias',
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
