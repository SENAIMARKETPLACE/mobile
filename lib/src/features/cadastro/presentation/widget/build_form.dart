// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BuildForm extends StatelessWidget {
  const BuildForm({
    Key? key,
    required this.formKey,
    required this.inputs,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final Widget inputs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 198, 146, 243),
                  Color.fromARGB(255, 198, 166, 243),
                ],
              ),
            ),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 39, 77, 109),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 198, 146, 243),
              Color.fromARGB(255, 167, 222, 222),
            ],
          )),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: inputs,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
