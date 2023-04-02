import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sucess extends StatelessWidget {
  const Sucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Company'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Container(
                child: const Icon(
                  FontAwesomeIcons.circleCheck,
                  color: Colors.green,
                  size: 150,
                ),
              ),
            ),
            Container(
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Cadastro realizado com sucesso.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
