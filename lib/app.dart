import 'package:cep/src/features/register/presentation/view/screen_cnpj.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.purple,
      //   textTheme: const TextTheme(
      //     bodyMedium: TextStyle(
      //       color: Colors.purple,
      //     ),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      home: ScreenCnpj(),
    );
  }
}
