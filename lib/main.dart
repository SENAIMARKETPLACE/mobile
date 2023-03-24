import 'package:flutter/material.dart';
import 'package:sollaris_teste/app.dart';
import 'package:sollaris_teste/src/dependency_assembly.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(
    const MyApp(),
  );
}
