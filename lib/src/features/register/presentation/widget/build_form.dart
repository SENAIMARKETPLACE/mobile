import 'dart:io';

import 'package:cep/src/features/register/presentation/bloc/register_company_bloc.dart';
import 'package:cep/src/features/register/presentation/bloc/register_company_state.dart';
import 'package:cep/src/features/register/presentation/widget/build_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cep/src/dependency_assembly.dart' as di;

class BuildForm extends StatefulWidget {
  const BuildForm({super.key});

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  ImageProvider imageSelected = const AssetImage('assets/image/man.png');

  File? imageSele;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register Company'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => di.dependency<RegisterCompanyBloc>(),
          child: BlocBuilder<RegisterCompanyBloc, RegisterCompanyState>(
            builder: (context, state) {
              return BuildSteps(
                galeria: _onGallery,
                foto: imageSelected,
                entity: state.endereco,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onGallery() async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1800,
      maxWidth: 1800,
    );

    if (image != null) {
      setState(() {
        imageSelected = FileImage(File(image.path));
      });
    }
  }
}
