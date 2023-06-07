import 'package:cep/src/core/utils/app_routes.dart';
import 'package:cep/src/features/categorias/presentation/bloc/categorias_bloc.dart';
import 'package:cep/src/features/home/presentation/view/screen_home.dart';
import 'package:cep/src/features/produtos/presentation/bloc/produto_bloc.dart';
import 'package:cep/src/features/produtos/presentation/pages/screen_produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cep/src/dependency_assembly.dart' as di;

import 'src/features/categorias/presentation/view/screen_categoria.dart';
import 'src/features/categorias/presentation/view/screen_sub_categoria_all.dart';
import 'src/features/login/presentation/pages/screen_login.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.dependency<CategoriaBloc>(),
        ),
        BlocProvider(
          create: (context) => di.dependency<ProdutoBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ScreenProduto(id: ''),
        routes: {
          AppRoutes.login: (context) => const ScreenLogin(),
          AppRoutes.home: (context) => const ScreenHome(),
          AppRoutes.categorias: (context) => const ScreenCategoria(),
        },
      ),
    );
  }
}
