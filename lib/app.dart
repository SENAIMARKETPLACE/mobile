import 'package:cep/src/features/register/presentation/view/screen_cnpj.dart';
import 'package:flutter/material.dart';

import 'src/features/login/presentation/screen_register.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenRegister(),
    );
  }
}
