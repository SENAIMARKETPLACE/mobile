import 'dart:io';

import 'package:cep/src/dependency_assembly.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_state.dart';
import 'package:cep/src/features/register/presentation/view/build_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Company'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const BuildForm(),
              ));
            },
            child: const Text('Cadastrar')),
      ),
    );
  }
}


