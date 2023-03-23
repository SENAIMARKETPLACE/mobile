import 'package:flutter/material.dart';
import 'package:sollaris_teste/app.dart';
import 'package:sollaris_teste/src/dependency_assembly.dart';

Future<void> main() async {
  await init();
  runApp(
    const MyApp(),
  );
}
