// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:cep/src/features/categorias/presentation/view/screen_categoria.dart';
import 'package:cep/src/features/categorias/presentation/view/screen_sub_categoria_all.dart';
import 'package:cep/src/features/home/presentation/view/screen_home.dart';
import 'package:cep/src/features/login/presentation/pages/screen_login.dart';
import 'package:cep/src/features/produtos/presentation/pages/screen_produto_all.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cep/src/common/hive/access.dart';

class SollarisDrawer extends StatefulWidget {
  const SollarisDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<SollarisDrawer> createState() => _SollarisDrawerState();
}

class _SollarisDrawerState extends State<SollarisDrawer> {
  late final Access pref;
  String titleUser = 'Usuário';
  late final String idEmpresa;

  Future<Access> getPreferences() async {
    return pref = await PreferencesActions.load();
  }

  @override
  void initState() {
    super.initState();
    getPreferences().then((value) {
      setState(() {
        titleUser = value.nome;
        idEmpresa = value.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 186, 66, 197),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image/meme.webp'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  titleUser,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.house),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 99, 98, 98),
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ScreenHome(),
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.layerGroup),
            title: const Text(
              'Categorias',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 99, 98, 98),
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ScreenCategoria(),
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.codepen),
            title: const Text('Sub-Categorias',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 99, 98, 98),
                )),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ScreenSubCategoriaAll(),
              ),
            ),
          ),
          ListTile(
              leading: const FaIcon(FontAwesomeIcons.cartShopping),
              title: const Text('Gerenciar Produtos',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 99, 98, 98),
                  )),
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ScreenProdutoAll()),
                  )),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.rightFromBracket),
            title: const Text('Logout',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 99, 98, 98),
                )),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const ScreenLogin(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
