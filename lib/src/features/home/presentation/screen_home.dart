import 'package:cep/src/common/hive/access.dart';
import 'package:cep/src/common/hive/preferences_actions.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late final Access pref;

  Future<Access> getPreferences() async {
    return pref = await PreferencesActions.load();
  }

  @override
  void initState() {
    getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bem vindo, ${pref.nome}'),
      ),
    );
  }
}
