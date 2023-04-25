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
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0XFF14C871),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
