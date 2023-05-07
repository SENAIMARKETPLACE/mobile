import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late final Access pref;
  final int _selectedIndex = 0;

  Future<Access> getPreferences() async {
    return pref = await PreferencesActions.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sollaris'),
        centerTitle: true,
      ),
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
              return Center(
                child: Text('Bem vindo, ${pref.nome}'),
              );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushNamed(AppRoutes.home);
              break;
            case 1:
              Navigator.of(context).pushNamed(AppRoutes.categorias);
              break;
            case 2:
              break;
            default:
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categorias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Produtos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
