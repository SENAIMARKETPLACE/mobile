import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/core/presentation/widgets/sollaris_app_bar.dart';
import 'package:cep/src/core/utils/app_routes.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_event.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_state.dart';
import 'package:cep/src/features/categorias/presentation/view/screen_categoria.dart';
import 'package:cep/src/features/home/presentation/widgets/home_banner.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card.dart';
import 'package:cep/src/features/home/presentation/widgets/home_card_produto.dart';
import 'package:cep/src/features/home/presentation/widgets/home_list_categories.dart';
import 'package:cep/src/features/home/presentation/widgets/home_list_product.dart';
import 'package:cep/src/features/home/presentation/widgets/home_list_sub_categories.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_event.dart';
import 'package:cep/src/features/produtos/presentation/pages/screen_produto.dart';
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

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    // context.read<ProdutoBloc>().add(const GetProdutosEvent(id: '1'));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> test() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SollarisAppBar(),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: test,
        child: FutureBuilder(
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
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                  ),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      HomeBanner(nameCompany: 'Sollaris'),
                      HomeListCategories(
                        title: 'Minhas Categorias',
                        route: ScreenCategoria(),
                      ),
                      HomeListSubCategories(
                        title: 'Minhas Sub-Categorias',
                        idEmpresa: '1',
                      ),
                      HomeListProducts(
                          title: 'Meus Produtos',
                          heigthCarousel: 180,
                          idEmpresa: '1',
                          route: ScreenProduto(id: '1')),
                    ],
                  ),
                );
            }
          },
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
