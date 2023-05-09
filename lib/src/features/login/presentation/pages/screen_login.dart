import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          'assets/image/banner.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.78,
          height: MediaQuery.of(context).size.height * 0.70,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/image/logo.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  // child: Form(
                  //     key: _formKey,
                  //     child: SollarisTextField(
                  //       label: 'Login',
                  //       hint: 'Informe seu e-mail',
                  //       validator: (value) {
                  //         if (value != null) {
                  //           return 'E-mail inválido. Digite novamente';
                  //         }
                  //         return null;
                  //       },
                  //       controller: _controllerEmail,
                  //     )),
                ),
              )
            ],
          ),
        ),
        // const SollarisTitle(
        //   title: 'Login',
        // )
      ],
    ));
  }
}
