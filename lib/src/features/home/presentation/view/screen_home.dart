import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_app_bar.dart';
import 'package:cep/src/core/utils/app_routes.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:cep/src/features/home/presentation/widgets/home_banner.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card_produto.dart';
import 'package:cep/src/features/home/presentation/widgets/home_list_categories.dart';
import 'package:cep/src/features/home/presentation/widgets/home_list_product.dart';
import 'package:cep/src/features/home/presentation/widgets/home_list_sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late final Access pref;
  final int _selectedIndex = 0;

  final List<HomeCard> list = [
    const HomeCard(name: 'Esporte'),
    const HomeCard(name: 'Ginástica'),
    const HomeCard(name: 'Esporte'),
    const HomeCard(name: 'Ginástica'),
    const HomeCard(name: 'Esporte'),
    const HomeCard(name: 'Ginástica'),
    const HomeCard(name: 'Esporte'),
    const HomeCard(name: 'Ginástica'),
  ];

  Future<Access> getPreferences() async {
    return pref = await PreferencesActions.load();
  }

  @override
  void initState() {
    super.initState();
    context.read<CategoriaBloc>().add(GetCategoriasEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SollarisAppBar(),
      body: FutureBuilder(
        future: getPreferences(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return const Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  left: 8,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeBanner(nameCompany: 'Sollaris'),
                      HomeListCategories(title: 'Minhas Categorias'),
                      HomeListSubCategories(title: 'Minhas Sub-Categorias'),
                      HomeListProducts(
                          title: 'Meus Produtos', heigthCarousel: 180),
                    ],
                  ),
                ),
              );
          }
        },
      ),
      drawer: const Drawer(),
    );
  }
}
