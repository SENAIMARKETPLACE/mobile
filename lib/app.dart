import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sollaris_teste/src/dependency_assembly.dart' as di;
import 'package:sollaris_teste/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:sollaris_teste/src/features/signup/presentation/view/cep_form.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.dependency<SignUpBloc>(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CepForm(),
      ),
    );
  }
}
