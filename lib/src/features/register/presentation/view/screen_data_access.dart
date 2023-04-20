// import 'package:cep/src/utils/widget_text_button.dart';
// import 'package:cep/src/utils/widget_text_field_register.dart';
// import 'package:cep/src/utils/widget_title.dart';
// import 'package:flutter/material.dart';

// class ScreenDataAcess extends StatelessWidget {
//   const ScreenDataAcess({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const Icon(
//           Icons.arrow_back_ios,
//           color: Color(0XFF14C871),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(bottom: 7, left: 10, right: 10),
//         child: Form(
//           child: SingleChildScrollView(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height * 0.85,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const WidgetTitle(title: "Dados de Acesso"),
//                   Container(
//                     child: Column(
//                       children: const [
//                         WidgetTextFieldRegister(
//                           label: "E-mail",
//                           hint: "email@example.com",
//                         ),
//                         WidgetTextFieldRegister(
//                           label: "Telefone",
//                           hint: "(99) 99999-9999",
//                         ),
//                         WidgetTextFieldRegister(
//                           label: "Senha",
//                           hint: "Digite sua senha",
//                         ),
//                         WidgetTextFieldRegister(
//                           label: "Confirme sua senha",
//                           hint: "Repita sua senha",
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                       alignment: Alignment.bottomCenter,
//                       child: WidgetTextButton(action: () {})),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
