import 'package:cep/src/utils/widget_text_button.dart';
import 'package:cep/src/utils/widget_text_field_register.dart';
import 'package:cep/src/utils/widget_title.dart';
import 'package:flutter/material.dart';

class ScreenCep extends StatelessWidget {
  const ScreenCep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color(0XFF14C871),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            const WidgetTitle(
              title: 'Onde a empresa está localizada',
            ),
            const SizedBox(height: 20),
            const WidgetTextFieldRegister(
              label: 'CEP',
              hint: 'Informe o CEP',
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: WidgetTextButton(action: () {})),
            ),
          ],
        ),
      ),
    );
  }
}
