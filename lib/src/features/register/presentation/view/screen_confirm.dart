import 'dart:developer';

import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:flutter/material.dart';

class ScreenConfirm extends StatefulWidget {
  const ScreenConfirm({super.key});

  @override
  State<ScreenConfirm> createState() => _ScreenConfirmState();
}

class _ScreenConfirmState extends State<ScreenConfirm> {
  //  result = {};

  void loadData() async {
    final result = await LocalDataSource().loadDate();
    result.forEach((key, value) {
      log('$key > $value');
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // loadData().then((value) => log('${value['cnpj']}'));

    return const Scaffold();
  }
}
