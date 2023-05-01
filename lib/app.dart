import 'package:flutter/material.dart';

import 'src/features/login/presentation/pages/screen_login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenLogin(),
    );
  }
}
