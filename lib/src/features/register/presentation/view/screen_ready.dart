import 'dart:developer';

import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:flutter/material.dart';

class ScreenReady extends StatefulWidget {
  const ScreenReady({super.key});

  @override
  State<ScreenReady> createState() => _ScreenReadyState();
}

class _ScreenReadyState extends State<ScreenReady> {
  


  void loadCounter() async {
    final result = await LocalDataSource().loadDate();
  }

  @override
  void initState() {
    loadCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        // Text(),
        // Text(result),
        // Text(result),
        // Text(result),
        // Text(result),
        // Text(result),
        // Text(result),
        // Text(result),
        // Text(result),
      ]),
    );
  }
}
