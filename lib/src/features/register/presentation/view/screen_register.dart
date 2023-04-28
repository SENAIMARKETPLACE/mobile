// import 'package:cep/src/utils/widget_caption.dart';
// import 'package:cep/src/utils/widget_text_button_acess.dart';
// import 'package:cep/src/utils/widget_text_button_register.dart';
// import 'package:cep/src/utils/widget_text_field_register.dart';
// import 'package:cep/src/utils/widget_title.dart';
// import 'package:flutter/material.dart';

// class ScreenRegister extends StatelessWidget {
//   const ScreenRegister({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const Icon(
//           Icons.arrow_back_ios,
//           color: Color(0XFF14C871),
//         ),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.height,
//         padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const WidgetTitle(
//               title: 'Acesse',
//             ),
//             const WidgetCaption(title: "Use seu e-mail e senha para acessar"),
//             const SizedBox(height: 20),
//             const WidgetTextFieldRegister(
//               label: 'E-mail',
//               hint: 'Digite seu e-mail',
//             ),
//             const WidgetTextFieldRegister(
//               label: 'Senha',
//               hint: 'Digite sua senha',
//             ),
//             Row(
//               children: [
//                 Align(
//                     alignment: Alignment.bottomCenter,
//                     child: WidgetTextButtonAcess(action: () {})),
//                 const SizedBox(
//                   width: 25,
//                 ),
//                 Align(
//                     alignment: Alignment.bottomCenter,
//                     child: WidgetTextButtonRegister(action: () {})),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
