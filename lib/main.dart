import 'package:cep/app.dart';
import 'package:flutter/material.dart';
import 'package:cep/src/dependency_assembly.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(
    const MyApp(),
  );
}
