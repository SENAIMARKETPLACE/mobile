import 'dart:io';

import 'package:cep/src/features/register/presentation/widget/build_steps.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Company'),
        centerTitle: true,
      ),
      body: BuildSteps(
        galeria: _onGallery,
        foto: imageSelected,
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
